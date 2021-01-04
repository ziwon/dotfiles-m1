#!/bin/sh
CURDIR="$( cd "$( dirname "$0" )" && pwd )"
BASEDIR="${CURDIR%/*}"

echo "Install dotfiles (ver. 2021).."
sudo -v

# Update existing `sudo` time stamp until `install.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install
source $BASEDIR/homebrew/install.sh

