#!/usr/bin/env bash

cat << EOF
▀█ █▀ █░█
█▄ ▄█ █▀█
EOF

# change directory to where this script is located
cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

mkdir -p ${ZDOTDIR}

# zsh startup
#
# http://zsh.sourceforge.net/Intro/intro_3.html
# 1. `~/.zshenv`            Run for all invocations of the zsh
# 2. `$ZDOTDIR/.zprofile`   Run for login shells
# 3. `$ZDOTDIR/.zshrc`      Run for interactive shells
# 4. `$ZDOTDIR/.zlogin`     Run for login shells


link autoload.zsh $ZDOTDIR/autoload.zsh
link setopt.zsh   $ZDOTDIR/setopt.zsh
link bindkey.zsh  $ZDOTDIR/bindkey.zsh
link alias.zsh    $ZDOTDIR/alias.zsh
link func.zsh     $ZDOTDIR/func.zsh
link prompt.zsh   $ZDOTDIR/prompt.zsh
link plugin.zsh   $ZDOTDIR/plugin.zsh
link p10k.zsh     $ZDOTDIR/p10k.zsh

link .zshenv      $ZDOTDIR/.zshenv
link .zprofile    $ZDOTDIR/.zprofile
link .zlogin      $ZDOTDIR/.zlogin
link .zshrc       $ZDOTDIR/.zshrc
link .zshrc.conda $ZDOTDIR/.zshrc.conda


# Fix a problem to load .zshenv with ZDOTDIR in Tmux
# # https://www.khasegawa.net/posts/2018/12/fix-zsh-environment-variables/
 [[ ! -f "~/.zshenv" ]] && {
   echo "export ZDOTDIR=${HOME}/.config/zsh; source ${ZDOTDIR}/.zshenv" | tee ~/.zshenv
 }

# back to root directory
cd -
