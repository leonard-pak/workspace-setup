# My workspaces

## Manual

1. Install chrome
2. Install git
3. Add ssh key
4. (Optional) Install vpn
5. Create `reps` folder
6. Clone this repo here
7. Install docker, docker-compose, nvidia-container-toolkit

## Gnome

1. Install extension-manager
2. Install extensions:
   1. Run and raise - run or focus apps by hotkeys
   2. AppIndicator and KStatusNotifierItem Support - system tray
   3. Blur my Shell - customization
   4. Transparent Window Moving
   5. Run or raise - shortcuts (see configs/shortcuts.conf)
   6. Executor - for get information about ollama status in tray
   7. Custom Command Menu - for manager ollama by command call in tray
   8. No overview at start-up - disable Overview by default

## Programs

1. VS Code
2. Telegram

## Config bash

1. (Optional) Add new user

    ```bash
    adduser new-user
    usermod -a -G adm,dialout,cdrom,floppy,sudo,audio,dip,video,plugdev,netdev new-user
    echo -e "[user]\ndefault=new-user" >> /etc/wsl.conf
    passwd root
    ```

1. Install zsh and oh-my-zsh
1. Install Hack Nerd Font
1. Install eza
1. Install thefuck
1. Install vim
1. Install bat
1. Upgrade *.zshrc*
1. Install tmux
1. Install alacritty

> or call necessary setup script
