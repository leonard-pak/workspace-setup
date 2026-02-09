#!/bin/bash
set -e

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

i_pkg() {
    local pkg=$1
    if ! pacman -Qi "$pkg" > /dev/null 2>&1; then
        echo "Пакет $pkg не найден. Установка..."
         pacman -Sy --noconfirm "$pkg"
    else
        echo "Пакет $pkg уже установлен."
    fi
}

# Prepare
i_pkg wget
i_pkg curl
i_pkg git

# Install zsh and oh-my-zsh
i_pkg zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change zsh theme
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="gozilla"/' "$HOME"/.zshrc 

# Install Hack Nerd Font
sudo mkdir -p /usr/local/share/fonts/hack
wget -O - https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.tar.xz | sudo tar Jx -C /usr/local/share/fonts/hack
sudo chown -R root: /usr/local/share/fonts/hack
sudo chmod 644 /usr/local/share/fonts/hack/*
sudo fc-cache -v

# Install EZA
i_pkg eza

# Install thefuck
i_pkg thefuck

# Install vim
i_pkg vim
echo "source $SCRIPT_DIR/configs/.vimrc" | sudo tee -a /etc/vimrc > /dev/null
git config --global core.editor "vim"

# Install bat
i_pkg bat

# Upgrade .zshrc
{
    echo "source $SCRIPT_DIR/configs/.zshrc"
    echo "source $SCRIPT_DIR/tools/.aliases"
    echo "source $SCRIPT_DIR/tools/.aliases-arch"
} >> "$HOME"/.zshrc

# Install tmux
i_pkg tmux
i_pkg wl-clipboard
ln -s "$SCRIPT_DIR"/configs/.tmux.conf "$HOME"/.tmux.conf

# Install alacritty
i_pkg alacritty
mkdir -p "$HOME"/.config/alacritty/
ln -s "$SCRIPT_DIR"/configs/alacritty.toml "$HOME"/.config/alacritty/alacritty.toml

# Add zsh plugins
i_pkg zsh-syntax-highlighting
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME"/.zshrc
sed -i "s/^plugins=.*/plugins=(git sudo history)/" "$HOME"/.zshrc

# Others
i_pkg flameshot
