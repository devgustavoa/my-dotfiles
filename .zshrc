export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias reboot="loginctl reboot"
alias poweroff="loginctl poweroff"

export EDITOR="emacs"
export JAVA_HOME="$(java-config --jdk-home)"
export PATH="$HOME/.cargo/bin:$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

command -v ng >/dev/null 2>&1 && source <(ng completion script)
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"
