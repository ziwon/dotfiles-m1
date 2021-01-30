#!/usr/bin/env bash

cat <<EOF
█▀█ █░█ █▄▄ █▄█
█▀▄ █▄█ █▄█ ░█░
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# enable asdf
source /usr/local/opt/asdf/asdf.sh

echo "Installing ruby.."
asdf-add ruby
asdf install ruby 2.7.1
asdf global ruby 2.7.1

cd -
