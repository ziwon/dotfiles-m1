#!/usr/bin/env bash

cat <<EOF
█▀▀ █▀█ █░░ ▄▀█ █▄░█ █▀▀
█▄█ █▄█ █▄▄ █▀█ █░▀█ █▄█
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

echo "Installing golang.."
asdf-add golang
asdf install golang 1.15.7
asdf global golang 1.15.7

cd -

