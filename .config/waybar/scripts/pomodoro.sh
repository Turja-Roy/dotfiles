#!/bin/bash

# Left click: toggle arc/clock | Right click: start/pause/resume | Middle click: reset

STATE_FILE="/tmp/waybar_pomodoro"

FOCUS_DUR=1500
SHORT_BREAK_DUR=300
LONG_BREAK_DUR=1200
SESSIONS_BEFORE_LONG=4

# nf-md-circle_slice_8 → 1 (full → almost empty)
ARC_ICONS=("󰪥" "󰪤" "󰪣" "󰪢" "󰪡" "󰪠" "󰪟" "󰪞")

init_state() {
    cat > "$STATE_FILE" <<EOF
phase=focus
status=stopped
session=1
display_mode=arc
start_epoch=0
elapsed_at_pause=0
EOF
}

read_state() {
    [[ ! -f "$STATE_FILE" ]] && init_state
    # shellcheck source=/dev/null
    source "$STATE_FILE"
}

write_state() {
    cat > "$STATE_FILE" <<EOF
phase=$phase
status=$status
session=$session
display_mode=$display_mode
start_epoch=$start_epoch
elapsed_at_pause=$elapsed_at_pause
EOF
}

get_duration() {
    case "$1" in
        focus)       echo $FOCUS_DUR ;;
        short_break) echo $SHORT_BREAK_DUR ;;
        long_break)  echo $LONG_BREAK_DUR ;;
    esac
}

get_elapsed() {
    case "$status" in
        stopped) echo 0 ;;
        paused)  echo "$elapsed_at_pause" ;;
        running) echo $(( $(date +%s) - start_epoch + elapsed_at_pause )) ;;
    esac
}

advance_phase() {
    if [[ "$phase" == "focus" ]]; then
        if [[ "$session" -ge "$SESSIONS_BEFORE_LONG" ]]; then
            phase="long_break"
        else
            phase="short_break"
        fi
    elif [[ "$phase" == "short_break" ]]; then
        session=$(( session + 1 ))
        phase="focus"
    else
        session=1
        phase="focus"
    fi
    start_epoch=$(date +%s)
    elapsed_at_pause=0
    status=running
}

case "$1" in
    toggle-mode)
        read_state
        [[ "$display_mode" == "arc" ]] && display_mode="clock" || display_mode="arc"
        write_state
        exit 0
        ;;
    pause)
        read_state
        case "$status" in
            stopped)
                start_epoch=$(date +%s)
                status=running
                ;;
            running)
                elapsed_at_pause=$(get_elapsed)
                start_epoch=0
                status=paused
                ;;
            paused)
                start_epoch=$(date +%s)
                status=running
                ;;
        esac
        write_state
        exit 0
        ;;
    reset)
        read_state
        phase=focus
        status=stopped
        session=1
        start_epoch=0
        elapsed_at_pause=0
        write_state
        exit 0
        ;;
    skip)
        read_state
        advance_phase
        write_state
        exit 0
        ;;
esac

read_state

duration=$(get_duration "$phase")
elapsed=$(get_elapsed)

if [[ "$status" == "running" && "$elapsed" -ge "$duration" ]]; then
    advance_phase
    write_state
    duration=$(get_duration "$phase")
    elapsed=0
fi

remaining=$(( duration - elapsed ))
[[ $remaining -lt 0 ]] && remaining=0

if [[ "$display_mode" == "arc" ]]; then
    ratio=$(( elapsed * 8 / duration ))
    [[ $ratio -gt 7 ]] && ratio=7
    text="${ARC_ICONS[$ratio]}"
else
    text=$(printf "%02d:%02d" $(( remaining / 60 )) $(( remaining % 60 )))
fi

case "$status" in
    stopped) text="$text ▶" ;;
    paused)  text="$text ⏸" ;;
esac

case "$phase" in
    focus)       css_class="focus" ;;
    short_break) css_class="short-break" ;;
    long_break)  css_class="long-break" ;;
esac

tooltip=$(printf "%s • %d/%d • %02d:%02d left" \
    "${phase//_/ }" "$session" "$SESSIONS_BEFORE_LONG" \
    $(( remaining / 60 )) $(( remaining % 60 )))

printf '{"text": "%s", "class": "%s", "tooltip": "%s"}\n' \
    "$text" "$css_class" "$tooltip"
