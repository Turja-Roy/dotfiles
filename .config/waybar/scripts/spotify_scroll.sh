#!/bin/bash
zscroll -l 20 \
    --delay 0.1 \
    --scroll-padding "     " \
    --match-command "playerctl --player=spotify status" \
    --match-text "Playing" "--scroll 1" \
    --match-text "Paused" "--scroll 0" \
    --update-check true \
    "playerctl --player=spotify metadata --format '{{ artist }} - {{ title }}'"
wait
