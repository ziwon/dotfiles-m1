########################################################################
# zstyle
########################################################################
# group matches
# zstyle ':completion:*:*:*:*:*' menu select
# zstyle ':completion:*:matches' group 'yes'
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:options' auto-description '%d'
# zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
# zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' verbose yes

# cache
# zstyle ':completion::complete:*' use-cache on
# zstyle ':completion::complete:*' cache-path "$ZINIT[ZCOMPDUMP_PATH]/zcompcache"

#zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
#zstyle ':completion:*' rehash true

# substring match
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# fuzzy matches
#zstyle ':completion:*' completer _complete _match _approximate
#zstyle ':completion:*:match:*' original only
#zstyle ':completion:*:approximate:*' max-errors 1 numeric
#zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# sudo, cd, process, kill
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# # https://github.com/Aloxaf/fzf-tab/issues/77
# local extract="
# # trim input
# local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# # get ctxt for current completion
# local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# # real path
# local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
# realpath=\${(Qe)~realpath}
# "

# fzf-tab

# zstyle ':fzf-tab:complete:(cd|ls|lsd):*' fzf-preview 'ls -1 --color=always -- $realpath'
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

# hosts
# https://unix.stackexchange.com/questions/375814/zsh-completion-rules-for-ssh
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[# ]*}//,/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# history
#zstyle ':completion:*:history-words' stop yes
#zstyle ':completion:*:history-words' remove-all-dups yes
#zstyle ':completion:*:history-words' list false
#zstyle ':completion:*:history-words' menu yes

########################################################################
# powerlevel9k
########################################################################

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
