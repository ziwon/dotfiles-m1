#!/usr/bin/env bash

cat <<EOF
█▀█ █░█ █▄▄ █▄█
█▀▄ █▄█ █▄█ ░█░
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

echo "Installing ruby.."
asdf-add ruby
asdf install ruby 2.7.1
asdf global ruby 2.7.1

cd -