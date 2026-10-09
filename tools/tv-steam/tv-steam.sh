#!/bin/bash
TV_NAME="Mi TV"

sleep 5

for edid in /sys/class/drm/card*-*/edid; do
    if edid-decode "$edid" 2>/dev/null | grep -q "$TV_NAME"; then
        exec steam -tenfoot
    fi
done