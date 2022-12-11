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
asdf plugin list 2>/dev/null | grep -E 'rust' &>/dev/null || {
  asdf plugin-add rust
}

asdf install rust 1.63.0
asdf global rust 1.63.0
asdf reshim rust

rustup self update

rustup toolchain add stable
rustup toolchain add nightly

rustup component add clippy
rustup component add rustfmt
rustup component add rust-src
rustup component add rls-preview --toolchain nightly
rustup component add rust-analysis --toolchain nightly
rustup component add rust-src --toolchain nightly
rustup component add rustc-dev --toolchain nightly
# rustup component add llvm-tools-preview --toolchain nightly

cargo +nightly install racer

git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer
cargo xtask install --server
cd ..
rm -rf rust-analyzer

asdf reshim rust
cd - 2>&1 1>/dev/null
