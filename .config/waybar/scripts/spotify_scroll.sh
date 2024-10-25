#!/bin/bash
zscroll -l 20 \
    --delay 0.1 \
    --scroll-padding "     " \
    --match-command "playerctl status" \
    --match-text "Playing" "--scroll 1" \
    --match-text "Paused" "--scroll 0" \
    --update-check true \
    "playerctl metadata --format '{{ artist }} - {{ title }}'"
wait
