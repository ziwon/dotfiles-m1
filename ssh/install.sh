#!/usr/bin/env bash

cat << EOF
█▀ █▀ █░█
▄█ ▄█ █▀█
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

echo "Descript SSH Key.."
mkdir -p $HOME/.ssh
keybase decrypt -i id_rsa.github.asc -o $HOME/.ssh/id_rsa.github
chmod 400 $HOME/.ssh/id_rsa.github

echo "Copying SSH Config.."
link config $HOME/.ssh/config

cd -

