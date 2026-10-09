#!/bin/bash
set -e

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

sudo ln -s "$SCRIPT_DIR"/tv-steam.sh /usr/local/bin/tv-steam.sh
sudo ln -s "$SCRIPT_DIR"/tv-steam.desktop "$HOME"/.config/autostart/tv-steam.desktop
