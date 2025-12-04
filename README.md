# My workspaces

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
1. Install neovim
1. Install bat
1. Upgrade *.zshrc*
1. Install tmux

> or call `./setup.bash`
