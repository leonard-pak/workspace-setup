#!/bin/bash
set -e

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

# Install sddm-astronaut-theme
bash -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

# Add my theme
sudo cp "$SCRIPT_DIR"/configs/sddm-theme.conf /usr/share/sddm/themes/sddm-astronaut-theme/Themes/ 
sudo cp "$SCRIPT_DIR"/artifacts/sddm-theme.png /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds/ 
sudo sed -i "s/^ConfigFile=Themes.*/ConfigFile=Themes\/sddm-theme.conf/" /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
