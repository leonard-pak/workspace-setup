#!/bin/bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

# Prepare
sudo dnf install -y wget

# Install zsh and oh-my-zsh
sudo dnf install -y zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Hack Nerd Font
sudo mkdir -p /usr/local/share/fonts/hack
wget -O - https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.tar.xz | sudo tar Jx -C /usr/local/share/fonts/hack
sudo chown -R root: /usr/local/share/fonts/hack
sudo chmod 644 /usr/local/share/fonts/hack/*
sudo restorecon -vFr /usr/local/share/fonts/hack
sudo fc-cache -v

# Install EZA
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
sudo chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza

# Upgrade .zshrc
echo "source $SCRIPT_DIR/configs/.zshrc" >> $HOME/.zshrc
echo "source $SCRIPT_DIR/tools/.aliases" >> $HOME/.zshrc

