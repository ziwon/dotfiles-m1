#!/usr/bin/env bash

[[ ! -z $DEBUG ]] && set -x

set -o errexit
set -o errtrace
set -o pipefail

cat <<EOF
#############################################################

█▀▄ █▀█ ▀█▀ █▀▀ █ █░░ █▀▀ █▀ ▄▄ █▀▄▀█ ▄█
█▄▀ █▄█ ░█░ █▀░ █ █▄▄ ██▄ ▄█ ░░ █░▀░█ ░█
(email: yngpil.yoon@gmail.com)

#############################################################

EOF


# common
println() {
  printf "%s\n" "$*";
}

link() {
  if [[ -e $1 ]]; then
    println "linking $1 -> $2"
    ln -sf "$PWD/$1" "$2"
  fi
}

exists() {
  command -v "$1" >/dev/null 2>&1
}

asdf-add() {
  if ! asdf plugin-list | grep $1 >/dev/null; then
    println "asdf> add plugin $name"
    [[ ! -z "$2" ]] && asdf plugin-add "$1" "$2" || asdf plugin-add "$1"
  fi
}

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Envs for all
source ./zsh/.zshenv

case $1 in
  brew)
    source ./homebrew/install.sh
    ;;
  zsh)
    source ./zsh/install.sh
    ;;
  git)
    source ./git/install.sh
    ;;
  tmux)
    source ./tmux/install.sh
    ;;
  python)
    source ./python/install.sh
    ;;
  ruby)
    source ./ruby/install.sh
    ;;
  vim|nvim)
    source ./nvim/install.sh
    ;;
  golang)
    source ./golang/install.sh
    ;;
  nnn)
    source ./nnn/install.sh
    ;;
  ssh)
    source ./ssh/install.sh
    ;;
  all)
    source ./homebrew/install.sh
    source ./zsh/install.sh
    source ./git/install.sh
    source ./tmux/install.sh
    source ./python/install.sh
    source ./golang/install.sh
    source ./nvim/install.sh
esac
