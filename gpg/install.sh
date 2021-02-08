#!/usr/bin/env bash

# See lastpass for your passphrase
mkdir -p $HOME/.share/gnupg

# Set permissions
chown -R $(whoami) $HOME/.share/gnupg/
chmod 600 $HOME/.share/gnupg/*
chmod 700 $HOME/.share/gnupg

# Import keybase
curl https://keybase.io/ziwon/pgp_keys.asc | gpg --import
