#!/bin/bash
set -e

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

sudo wget -P /usr/sbin/ https://github.com/Nortank12/deepcool-digital-linux/releases/latest/download/deepcool-digital-linux
sudo chmod +x /usr/sbin/deepcool-digital-linux
sudo cp "$SCRIPT_DIR"/tools/deepcool-digital.service /etc/systemd/system/
sudo systemctl enable --now deepcool-digital

# For reload need to copy file 'deepcool-digital.service' again