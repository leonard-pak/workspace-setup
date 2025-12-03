# EZA
function eza_chpwd() {
  eza -l -a --icons
}
chpwd_functions+=(eza_chpwd)
# THEFUCK
eval $(thefuck --alias f)
# BAT
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
