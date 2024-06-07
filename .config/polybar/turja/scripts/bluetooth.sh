#!/bin/sh

if bluetoothctl show | grep -q "Powered: yes"; then
    if bluetoothctl info | grep -q "Connected: yes"; then
        device_name=$(bluetoothctl info | grep 'Name' | cut -d ' ' -f 2-)
        echo "%{F#17f120} $device_name"
    else
        echo ""
    fi
else
    echo "%{F#FF5250}"
fi
