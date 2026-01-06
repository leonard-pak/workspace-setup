#!/bin/bash
set -e

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

sudo wget -P /usr/sbin/ https://github.com/Nortank12/deepcool-digital-linux/releases/latest/download/deepcool-digital-linux
sudo chmod +x /usr/sbin/deepcool-digital-linux
sudo ln -s "$SCRIPT_DIR"/tools/deepcool-digital.service /etc/systemd/system/deepcool-digital.service
sudo systemctl enable --now deepcool-digital