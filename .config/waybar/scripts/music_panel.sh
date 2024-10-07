CURRENT_SONG="/home/turja/.config/waybar/scripts/current_song.sh"

# zscroll -p " | " --delay 0.2 \
#     --length 40 \
#     --match-command "playerctl status" \
#     --match-text "Playing" "--scroll 1" \
#     --match-text "Paused" "--before-text ' ' --scroll 0" \
#     --update-interval 1 \
#     --update-check true $CURRENT_SONG &
# wait

zscroll --before-text "♪ x" --delay 0.2 \
		--match-command "playerctl status" \
		--match-text "Playing" "--before-text ' '" \
		--match-text "Paused" "--before-text ' ' --scroll 0" \
		--update-check true $CURRENT_SONG &
wait
