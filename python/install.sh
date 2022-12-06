#!/usr/bin/env bash

cat <<EOF
█▀█ █▄█ ▀█▀ █░█ █▀█ █▄░█
█▀▀ ░█░ ░█░ █▀█ █▄█ █░▀█
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

echo "Installing python.."
asdf-add python
asdf install python 3.11.0
asdf global python 3.11.0

echo "Installing pip.."
pip install --upgrade pip
asdf reshim python

echo "Install poetry.."
asdf plugin-add poetry
asdf install poetry 1.2.2
asdf global poetry 1.2.2

cd -
