#!/usr/bin/env bash

cat << EOF
█▀ █▀ █░█
▄█ ▄█ █▀█
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

echo "Decrypting SSH Key.."
mkdir -p $HOME/.ssh
keybase decrypt -i id_rsa.github.asc -o id_rsa.github && chmod 400 id_rsa.github
keybase decrypt -i id_rsa.pi.asc -o id_rsa.pi && chmod 400 id_rsa.pi

echo "Copying SSH Config.."
link config $HOME/.ssh/config
link id_rsa.github $HOME/.ssh/id_rsa.github
link id_rsa.pi $HOME/.ssh/id_rsa.pi

cd - 2>&1 1>/dev/null
