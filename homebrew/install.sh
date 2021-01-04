#!/bin/sh

set -x

# x86_64
if test ! $(which brew); then
  arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# arm64
#if [ ! -d "/opt/homebrew" ]; then
#  pushd ~ &> /dev/null
#  mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
#  sudo mv homebrew /opt/homebrew
#  pod &> /dev/null
#fi

# Allow to install apps from anywhere in Gatekeeper
sudo spctl --master-disable

arch -x86_64 brew update
arch -x86_64 brew bundle

# Return to the default strict mode in Gatekeeper
sudo spctl --master-enable