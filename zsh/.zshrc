
[[ -o interactive ]] || return

PS1="READY > "

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# zinit install & config
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load modules
source "$ZDOTDIR"/setopt.zsh
source "$ZDOTDIR"/autoload.zsh
source "$ZDOTDIR"/plugin.zsh
source "$ZDOTDIR"/alias.zsh
source "$ZDOTDIR"/func.zsh
source "$ZDOTDIR"/bindkey.zsh
source "$ZDOTDIR"/prompt.zsh
source "$ZDOTDIR"/p10k.zsh
