#!/usr/bin/env bash

cat <<EOF
█▀█ █▄█ ▀█▀ █░█ █▀█ █▄░█
█▀▀ ░█░ ░█░ █▀█ █▄█ █░▀█
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# enable asdf
source /usr/local/opt/asdf/asdf.sh

echo "Installing python.."
asdf-add python
asdf install python 3.9.1
asdf global python 3.9.1

echo "Installing pip.."
pip install --upgrade pip
asdf reshim python

echo "Install poetry.."
asdf plugin-add poetry
asdf install poetry 1.1.4
asdf global poetry 1.1.4

cd -
