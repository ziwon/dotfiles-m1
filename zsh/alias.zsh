# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# ls
case $LS_MOD in
  lsd)
    alias ls='lsd'
    alias ll='lsd -l --group-dirs=first'
    alias la='lsd -la  --group-dirs=first'
    alias lt='lsd --tree'
    alias tree='lsd --tree'
    alias tree1='lsd --tree --depth 1'
    alias tree2='lsd --tree --depth 2'
    alias tree3='lsd --tree --depth 3'
    ;;
  exa)
    alias ls='exa'
    alias ll='exa -lah --git --group-directories-first'
    alias la='exa -a'
    alias lt='exa -Ta --sort=modified --reverse --group-directories-first'
    alias tree='exa --tree'
    alias tree1='exa --tree --level=1'
    alias tree2='exa --tree --level=2'
    alias tree3='exa --tree --level=3'
    ;;
  *)
    alias ls='ls'
    alias lr='ls -R'
    alias ll='ls -lah'
    alias la='ls -A'
    alias lx='ls -l -BX'
    alias lz='ls -l -rS'
    alias lt='ls -l -rt'
    alias tree='tree'
esac

# bat
alias cat='bat --style=numbers,changes'

# gnu
alias base64='gbase64'
alias grep='ggrep'
alias tar='gnu-tar'
alias sed='gsed'
alias awk='gawk'
alias date='gdate'

# vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias grep='grep --color=auto'

# tmux
alias t='tmux -2'
alias tmux='tmux -2'
alias tl='tmux ls'
alias tn='tmux new'
alias ta='tmux a'
alias tk='tmux kill-server'

# nnn
alias n='nnn -de'

# curl
alias get='curl -O -L'

# kubectl
alias k='kubectl'

# asdf
alias update-nvim-nightly='asdf uninstall neovim nightly && asdf install neovim nightly'

# bpytop
alias bpytop='bpytop -lc'

# app
if [[ $(uname) = "Darwin" ]]; then
    alias firefox='open -a Firefox'
    alias chrome='open -a Chrome'
fi

alias abrew='/opt/homebrew/bin/brew'
alias install_arm_brew='abrew bundle --file $DOTFILE_HOME/Brewfile.arm'
