#!/usr/bin/env bash

cat << EOF
▀█▀ █▀▄▀█ █░█ ▀▄▀
░█░ █░▀░█ █▄█ █░█
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

mkdir -p ${TMUX_HOME}

if [ ! -e "$TMUX_PLUGIN_MANAGER_PATH/tpm" ]; then
	echo "Installing tpm.."
	mkdir -p $TMUX_PLUGIN_MANAGER_PATH && \
    git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_PATH/tpm
fi

echo "Installing TPM plugins.."
tmux new -d -s __noop >/dev/null 2>&1 || true
$TMUX_PLUGIN_MANAGER_PATH/tpm/bin/install_plugins || true
tmux kill-session -t __noop >/dev/null 2>&1 || true

link .tmux.conf $TMUX_CONFIG
link .base16.conf $TMUX_HOME/.base16.conf

cd -
