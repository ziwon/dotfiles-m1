# language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# preferencess
export EDITOR=vim
export VISUAL=vim
export PAGER='less -isr'
export MANPAGER='less -+N'
export LESSCHARSET=utf-8

# https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export BLOCK_SIZE=human-readable
export TERM=xterm-256color

export GPG_TTY=$(tty)

# XDG dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.share
export XDG_RUNTIME_DIR=$HOME/.tmp
mkdir -p \
  $XDG_CONFIG_HOME \
  $XDG_DATA_HOME \
  $XDG_CACHE_HOME \
  $XDG_RUNTIME_DIR 2>/dev/null || true

# zsh
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh
export ZSH_CACHE_DIR=${XDG_CACHE_HOME:=$HOME/.cache}/zsh
mkdir -p \
  $ZSH_CACHE_DIR/completions || true

# vim
export VIMDOTDIR=$XDG_CONFIG_HOME/nvim
export MYVIMRC=${VIMDOTDIR}/init.vim

# tmux
export TMUX_HOME=${XDG_CONFIG_HOME}/tmux
export TMUX_CONFIG=${TMUX_HOME}/tmux.conf
export TMUX_PLUGIN_MANAGER_PATH=${TMUX_HOME}/plugins

# z
export ZSHZ_DATA=$XDG_DATA_HOME/z/.z
mkdir -p ${ZSHZ_DATA:h} 2>/dev/null && touch ${ZSHZ_DATA}

# aws
export AWS_SHARED_CREDENTIALS_FILE=${XDG_CONFIG_HOME}/aws/credentials
export AWS_CONFIG_FILE=${XDG_CONFIG_HOME}/aws/config

# docker
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export MACHINE_STORAGE_PATH=$XDG_DATA_HOME/docker-machine

# golang
export GOENV_ROOT=$XDG_DATA_HOME/goenv
export GOENV_GOPATH_PREFIX=$XDG_DATA_HOME/go
export GOBIN=$XDG_DATA_HOME/go/bin

# rust
export CARGO_HOME=$XDG_CACHE_HOME/cargo
export RUSTUP_HOME=$XDG_CACHE_HOME/rustup

# nodejs
export NODENV_ROOT=$XDG_DATA_HOME/nodenv
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node/repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_STORE_DIR=$XDG_CACHE_HOME/pnpm-store

# python
# export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export PIPX_HOME=$XDG_DATA_HOME/pipx
export PIPX_BIN_DIR=$XDG_DATA_HOME/pipx/bin
export POETRY_HOME=$XDG_DATA_HOME/poetry
export PYTHON_EGG_CACHE=$XDG_CACHE_HOME/python-eggs
export POETRY_HOME=$XDG_DATA_HOME/poetry

# ruby
export RBENV_ROOT=$XDG_DATA_HOME/rbenv
export IRBRC=$XDG_CONFIG_HOME/irb/irbrc
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle

# gnupg
export GNUPGHOME=$XDG_DATA_HOME/gnupg

# ripgrep
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config

# asdf
export ASDF_DIR=/opt/homebrew/opt/asdf/libexec
[[ -s "$ASDF_DIR/asdf.sh" ]] && source "$ASDF_DIR/asdf.sh"

# zinit
[[ -e $BASH ]] || {
  declare -A ZINIT
  ZINIT[HOME_DIR]=$XDG_CONFIG_HOME/zsh/zinit
  ZINIT[BIN_DIR]=$ZINIT[HOME_DIR]/bin
  ZINIT[PLUGINS_DIR]=$ZINIT[HOME_DIR]/plugins
  ZINIT[COMPLETIONS_DIR]=$ZINIT[HOME_DIR]/completions
  ZINIT[SNIPPETS_DIR]=$ZINIT[HOME_DIR]/snippets
  ZINIT[ZCOMPDUMP_PATH]=$XDG_CACHE_HOME/zsh/zcompdump
  export ZINIT
}
