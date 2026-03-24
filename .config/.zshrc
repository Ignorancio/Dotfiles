export TERM=xterm-256color
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.config/nvm"
export TIMER_PRECISION=1

ZSH_THEME="robbyrussell"
plugins=(git timer)

source $ZSH/oh-my-zsh.sh

alias fzfcd='cd "$(fd --type d --hidden --exclude .git | fzf --preview="tree -C {} | head -100")"'
alias fzfp='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'

alias fastpeppo='fastfetch --kitty-icat /home/igno/Descargas/peepo-pepe.gif --logo-width 45 --logo-height 22 --logo-padding-right 5'
alias fastdance='fastfetch --kitty-icat /home/igno/Descargas/4x.gif --logo-width 45 --logo-height 22 --logo-padding-right 5'
alias fastcute='fastfetch --kitty-icat /home/igno/Descargas/pinguino.gif --logo-width 45 --logo-height 22 --logo-padding-right 5'
alias fastspin='fastfetch --kitty-icat /home/igno/Descargas/spin.gif --logo-width 45 --logo-height 22 --logo-padding-right 5'


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
