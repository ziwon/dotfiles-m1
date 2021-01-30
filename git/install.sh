#!/usr/bin/env bash

cat << EOF
█▀▀ █ ▀█▀
█▄█ █ ░█░
EOF

# change directory to where this script is located
cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

link .gitconfig $HOME/.gitconfig
link .gitalias.txt $HOME/.gitalias.txt
link .gitexclude $HOME/.gitexclude

cd -
