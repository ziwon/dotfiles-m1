#!/usr/bin/env bash

cat << EOF
▒█▀▀█ ▒█▀▀█ ▒█▀▀█
▒█░▄▄ ▒█▄▄█ ▒█░▄▄
▒█▄▄█ ▒█░░░ ▒█▄▄█
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# See lastpass for your passphrase
mkdir -p $HOME/.share/gnupg

# Import keybase
curl https://keybase.io/ziwon/pgp_keys.asc | gpg --import

# Import secret keys
keybase pgp export -q 81A82D6E1ABC9F7A --secret | gpg --allow-secret-key-import --import

# Set permissions
chown -R $(whoami) $HOME/.share/gnupg/
chmod 600 $HOME/.share/gnupg/*
chmod 700 $HOME/.share/gnupg

cp -f ./gpg-agent.conf $HOME/.share/gnupg

cd - 2>&1 1>/dev/null
