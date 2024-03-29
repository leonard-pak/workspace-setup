# Custom aliases
alias cdbuild='mkdir build && cd build'
alias recmake='f(){ cd ../ && rm -rf build/!(_deps) && cd build && cmake "$@" ..; unset -f f; }; f'
alias ga='git add'
alias gc='git commit -m'
alias gs='git status -s'
alias gl='git log --pretty=format:"%C(yellow)%h %ad %C(red)| %C(white)%s%C(auto)%d %C(blue)[%an]" --graph --date=short'
alias gd='git diff'

# Bash settings
export HISTCONTROL=ignoredups
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s globstar

# Exa
alias ls="exa -l --no-user --no-filesize --no-permissions --no-time --icons"
alias ll="exa -l -a --icons"
alias lt="exa -T --icons"

# Z
. ~/z/z.sh

# Change prompt
eval "$(oh-my-posh prompt init bash)"
eval "$(oh-my-posh --init --shell bash --config $HOME/workspace-setup/configs/leonard_edition.omp.json)"
