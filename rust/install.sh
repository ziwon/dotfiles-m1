#!/usr/bin/env bash

# https://www.colorschemer.com/ascii-art-generator/#p=display&h=2&f=Bloody&t=rust
cat <<EOF
 ██▀███   █    ██  ██████ ▄▄▄█████▓
▓██ ▒ ██▒ ██  ▓██▒██    ▒ ▓  ██▒ ▓▒
▓██ ░▄█ ▒▓██  ▒██░ ▓██▄   ▒ ▓██░ ▒░
▒██▀▀█▄  ▓▓█  ░██░ ▒   ██▒░ ▓██▓ ░
░██▓ ▒██▒▒▒█████▓▒██████▒▒  ▒██▒ ░
░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒▒ ▒▓▒ ▒ ░  ▒ ░░
  ░▒ ░ ▒░░░▒░ ░ ░░ ░▒  ░ ░    ░
  ░░   ░  ░░░ ░ ░░  ░  ░    ░
   ░        ░          ░
EOF

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

echo "Installing rust.."
asdf plugin-add rust
asdf install rust latest
asdf global rust latest
asdf reshim rust

rustup toolchain add nightly
rustup component add clippy
rustup component add rustfmt
rustup component add rust-src

cargo +nightly install racer

git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer
cargo xtask install --server
cd ..
rm -rf rust-analyzer

asdf reshim rust
cd - 2>&1 1>/dev/null
