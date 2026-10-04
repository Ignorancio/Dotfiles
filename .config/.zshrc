export TERM=xterm-256color
export ZSH="$HOME/.oh-my-zsh"
export TIMER_PRECISION=1

ZSH_THEME="robbyrussell"
plugins=(git timer aws)

source $ZSH/oh-my-zsh.sh

alias fzfcd='cd "$(fd --type d --hidden --exclude .git | fzf --preview="tree -C {} | head -100")"'
alias fzfp='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'

export NVM_DIR="$HOME/.config/nvm"
[ -d "$NVM_DIR" ] || mkdir -p "$NVM_DIR"

source /usr/share/nvm/init-nvm.sh


# Added by Antigravity CLI installer
export PATH="/home/igno/.local/bin:$PATH"  