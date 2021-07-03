autoload -Uz compinit
if [[ -n $ZSH_CACHE_DIR/zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi;
autoload -U colors && colors
