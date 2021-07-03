
[[ -o interactive ]] || return

PS1="READY > "


# zinit install & config
if [[ ! -f "$ZINIT[BIN_DIR]/zinit.zsh" ]]; then
  git clone https://github.com/zdharma/zinit "${ZINIT[BIN_DIR]}"
fi

source "$ZINIT[BIN_DIR]/zinit.zsh"
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
