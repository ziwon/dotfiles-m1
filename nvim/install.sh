#!/usr/bin/env bash

cat << EOF
█▄░█ █░█ █ █▀▄▀█
█░▀█ ▀▄▀ █ █░▀░██
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Install vim plugin manager
echo "Installing plug manager"
if [[ ! -f ${XDG_CONFIG_HOME}/nvim/autoload/plug.vim ]]; then
  mkdir -p ${XDG_CONFIG_HOME}/nvim/autoload
  curl -fLo ${XDG_CONFIG_HOME}/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# enable asdf
source /usr/local/opt/asdf/asdf.sh

echo "Installing nvim.."
asdf-add neovim
asdf install neovim nightly
asdf global neovim nightly
asdf reshim neovim 

echo "Copying nvim.ini"
mkdir -p $VIMDOTDIR
mkdir -p $XDG_CACHE_HOME/nvim

link init.vim $VIMDOTDIR/init.vim

# install neovim python client
exists pip && pip install neovim || true
asdf reshim python

# install nvim plugins
echo "Installing nvim plugins.."
nvim +PlugInstall +qall > /dev/null

nvim "+silent call dein#install()" +UpdateRemotePlugins +qall > /dev/null

cd -
