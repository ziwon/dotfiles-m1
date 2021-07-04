autoload -Uz compinit
if [[ -n $ZSH_CACHE_DIR/zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi;

autoload -U colors && colors
autoload up-line-or-beginning-search down-line-or-beginning-search
autoload history-substring-search-up history-substring-search-down
autoload autosuggest-execute

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N history-substring-search-up
zle -N history-substring-search-down
zle -N autosuggest-execute
