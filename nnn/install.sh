#!/usr/bin/env bash

cat << EOF
█▄░█ █▄░█ █▄░█
█░▀█ █░▀█ █░▀██
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Install All NNN Plugins
if [[ ! -d ${XDG_CONFIG_HOME}/nnn/plugins ]]; then
  curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
fi
