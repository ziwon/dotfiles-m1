#!/usr/bin/env bash

cat << EOF
▒█▀▀█ ▒█▀▀█ ▒█▀▀█
▒█░▄▄ ▒█▄▄█ ▒█░▄▄
▒█▄▄█ ▒█░░░ ▒█▄▄█
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# See lastpass for your passphrase
# rm -rf $HOME/.share/gnupg
mkdir -p $HOME/.share/gnupg

# Set permissions
chown -R $(whoami) $HOME/.share/gnupg/
chmod 700 $HOME/.share/gnupg

# Import keybase
curl https://keybase.io/ziwon/pgp_keys.asc | gpg --import

# Import secret keys
keybase pgp export -q B71B7B232316168A --secret | gpg --allow-secret-key --import

cp -f ./gpg-agent.conf $HOME/.share/gnupg

cd - 2>&1 1>/dev/null
