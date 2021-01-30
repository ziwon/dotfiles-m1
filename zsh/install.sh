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

link .zshenv      $HOME/.zshenv

link autoload.zsh $ZDOTDIR/autoload.zsh
link setopt.zsh   $ZDOTDIR/setopt.zsh
link bindkey.zsh  $ZDOTDIR/bindkey.zsh
link alias.zsh    $ZDOTDIR/alias.zsh
link func.zsh     $ZDOTDIR/func.zsh
link prompt.zsh   $ZDOTDIR/prompt.zsh
link plugin.zsh   $ZDOTDIR/plugin.zsh

link .zlogin      $ZDOTDIR/.zlogin
link .zprofile    $ZDOTDIR/.zprofile

link .zshrc       $HOME/.zshrc

# back to root directory
cd -
