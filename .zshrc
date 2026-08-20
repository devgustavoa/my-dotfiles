export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"

export EDITOR="emacs"
export PATH="$HOME/.cargo/bin:$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"

unalias gf 2>/dev/null

export IDF_PATH="$HOME/esp/esp-idf"
alias get_idf='source "$HOME/esp/esp-idf/export.sh"'
