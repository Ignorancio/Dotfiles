export TERM=xterm-256color
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias fzfcd='cd "$(fd --type d --hidden --exclude .git | fzf --preview="tree -C {} | head -100")"'
alias fzfp='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'