#!/bin/sh

cat << EOF
█░█ █▀█ █▀▄▀█ █▀▀ █▄▄ █▀█ █▀▀ █░█░█
█▀█ █▄█ █░▀░█ ██▄ █▄█ █▀▄ ██▄ ▀▄▀▄▀
EOF

# x86_64
if [[ ! -d "/usr/local/Homebrew" ]]; then
  echo "Installing Homebrew (Intel)"
  pushd ~ &> /dev/null
  arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  chmod 755 /usr/local/share/zsh
  chmod 755 /usr/local/share/zsh/site-functions
  pod &> /dev/null
fi

# arm64
if [[ `uname -m` == "arm64" ]]; then
  if [[ ! -d "/opt/homebrew" ]]; then
    echo "Installing Homebrew (ARM)"
    pushd ~ &> /dev/null
    mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
    sudo mv homebrew /opt/homebrew
    pod &> /dev/null
  fi
fi

# Allow to install apps from anywhere in Gatekeeper
sudo spctl --master-disable

# Install packages with Homebrew (Intel)
brew update
brew bundle

# Return to the default strict mode in Gatekeeper
sudo spctl --master-enable
