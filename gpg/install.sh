#!/usr/bin/env bash

# See lastpass for your passphrase
mkdir -p $HOME/.share/gnupg
curl https://keybase.io/ziwon/pgp_keys.asc | gpg --import
