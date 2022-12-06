#!/usr/bin/env bash

cat << EOF
█▄░█ █░█ █ █▀▄▀█
█░▀█ ▀▄▀ █ █░▀░██
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Install vim plugin manager
echo "Installing plug manager"
if [[ ! -f ${XDG_DATA_HOME}/nvim/site/autoload/plug.vim ]]; then
  mkdir -p ${XDG_DATA_HOME}/nvim/site/autoload
  curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Installing nvim.."
asdf plugin list 2>/dev/null | grep -E 'neovim' &>/dev/null || {
  asdf plugin add neovim
  asdf install neovim nightly
  asdf global neovim nightly
  asdf reshim neovim 
}

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
