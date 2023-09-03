# My workspaces

> Clone to ***$HOME***

## Config bash
1. (Optional) Add new user
    ```bash
    adduser new-user
    usermod -a -G adm,dialout,cdrom,floppy,sudo,audio,dip,video,plugdev,netdev new-user
    echo -e "[user]\ndefault=new-user" >> /etc/wsl.conf
    passwd root
    ```
1. Install [oh-my-posh](https://ohmyposh.dev/docs/installation/linux)
    ```bash
    curl -s https://ohmyposh.dev/install.sh | bash -s
    ```
1. Install [exa](https://the.exa.website/)
1. Install [fzf](https://github.com/junegunn/fzf#using-linux-package-managers) with git
    ```bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    ```
1. Download [z](https://github.com/rupa/z)
    ```bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ```
1. Add to `.bashrc`
    1. Normal CLI
        ```bash
        echo ". ~/workspace-setup/bash/my-bash.bash" >> ~/.bashrc
        ```
    1. Jetson Nano
        ```bash
        echo ". ~/workspace-setup/jetson-bash.bash" >> ~/.bashrc
        ```
    1. win 10 with X-Server
        ```bash
        echo ". ~/workspace-setup/bash/x-server.bash" >> ~/.bashrc
        ```
    1. ROS2
        ```bash
        echo ". ~/workspace-setup/bash/ros2-bash.bash" >> ~/.bashrc
        ```

## For Docker
```docker
RUN git clone https://github.com/MrLeonardPak/workspace-setup.git $HOME/workspace-setup
RUN $HOME/workspace-setup/setup-docker.bash
```

## Fix git HTTPS token
```bash
git config --global url."https://{TOKEN}:@github.com/".insteadOf "https://github.com/"
```
## Config powershell
1. Config terminal like [this](https://youtu.be/5-aK2_WwrmM?si=2iyxmNNTKgyqiCas) before installing part `05:43`
1. Install [scoop](https://scoop.sh/#/)
1. Install tools
    ```powershell
    scoop install sudo curl neovim fzf
    winget install -e --id Git.Git
    ```
1. Install [oh-my-posh](https://ohmyposh.dev/docs/installation/windows). Used msstore source for autoupdate
    ```powershell
    winget install oh-my-posh -s msstore
    ```
1. Install modules
    ```powershell
    Install-Module -Name posh-git -Scope CurrentUser -Force
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Repository PSGallery -Force
    Install-Module -Name z -Scope CurrentUser -Force
    Install-Module -Name PSFzf -Scope CurrentUser -Force
    ```
2. Add profile file to autorun
    ```powershell
    echo ". $env:USERPROFILE\workspace-setup\powershell\user-profile.ps1" >> $PROFILE.CurrentUserCurrentHost
    ```
