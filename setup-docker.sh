# Download Oh My Posh
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
chmod +x /usr/local/bin/oh-my-posh

echo -e ". /my-workspace/.my-bash\n. /my-workspace/.bash-docker" >> $HOME/.bashrc