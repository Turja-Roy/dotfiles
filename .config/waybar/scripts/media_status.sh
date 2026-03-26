#!/bin/bash

BARS="▁▂▃▄▅▆▇█"

for PLAYER in $(playerctl --list-all 2>/dev/null); do
	if playerctl -p "$PLAYER" status 2>/dev/null | grep -q "Playing"; then
		T=$(date +%s%N)
		N=$((T / 100000000 % 8))
		echo -n "${BARS:$N:1}"
		exit 0
	fi
done
