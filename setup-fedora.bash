#!/bin/bash
set -e

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

# Prepare
sudo dnf install -y wget curl git

# Install zsh and oh-my-zsh
sudo dnf install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change zsh theme
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="gozilla"/' "$HOME"/.zshrc 

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

# Install thefuck
sudo dnf install -y python3-pip

# Install neovim
sudo dnf install -y neovim
git config --global core.editor "nvim"

# Install bat
sudo dnf install -y bat

# Upgrade .zshrc
echo "source $SCRIPT_DIR/configs/.zshrc" >> "$HOME"/.zshrc
echo "source $SCRIPT_DIR/tools/.aliases" >> "$HOME"/.zshrc

# Install tmux
sudo dnf install -y tmux
ln -s "$SCRIPT_DIR"/configs/.tmux.conf "$HOME"/.tmux.conf

# Install  alacritty
sudo dnf install -y alacritty
mkdir -p "$HOME"/.config/alacritty/
ln -s "$SCRIPT_DIR"/configs/alacritty.toml "$HOME"/.config/alacritty/alacritty.toml
