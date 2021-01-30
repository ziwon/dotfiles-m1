# dotfiles
export DOTFILE_HOME=$HOME/.dotfiles

# colors
export CLICOLOR=1
export LS_COLORS='gxfxbEaEBxxEhEhBaDaCaD'
export COLORTERM='truecolor'

# zsh theme
export BASE16_THEME='embers'  # codeschool, flat, material-palenight, embers and more: https://glitchbone.github.io/vscode-base16-term/

# vim theme
export VIM_COLOR_SCHEME="base16-${BASE16_THEME}" # twilight, onedark, material-dark, grayscale-dark
export VIM_AIRLINE_THEME="base16_${BASE16_THEME}" # bubblegum # https://github.com/vim-airline/vim-airline/wiki/Screenshots

# tmux theme
export TMUX_COLOR_SCHEME=${BASE16_THEME}

# ls mode
export LS_MOD=exa

# fzf
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --ignore-file ~/.gitignore"
export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --theme=Nord --wrap=never --color=always --pager=never {}"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_DEFAULT_OPTS="-m"
FZF_DEFAULT_OPTS+=" --color='light'"
FZF_DEFAULT_OPTS+=" --height 80%"
FZF_DEFAULT_OPTS+=" --bind 'ctrl-u:preview-up,ctrl-d:preview-down,ctrl-o:toggle+up,ctrl-i:toggle+down,ctrl-space:toggle-preview'"
FZF_DEFAULT_OPTS+=" --preview '${FZF_PREVIEW_COMMAND}'"

# nnn
export NNN_COLORS='4231'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_BMS="d:~/Documents;w:~/Workspace;g:~/Workspace/GitHub;x:~/Download;D:~/.dotfiles;"
export NNN_PLUG="g:_git status;b:_nnn-bookmarks*;x:_chmod +x $nnn;z:fzcd;f:finder;o:fzopen;p:preview-tui;i:imgview;P:-_less -iR $nnn*;v:_nvim"
export NNN_OPENER=less
export NNN_TRASH=1

# unique path
typeset -gU path # cdpath fpath

# path
path=(
  $HOME/.krew/bin
  ${GOBIN}
  ${CARGO_HOME}/bin(N-/)
  ${ASDF_DATA_DIR}/shims(N-/)
  /usr/local/{bin,sbin}
  /opt/homebrew/bin
  $path
)

# hook
if (( $+commands[direnv] )); then eval "$(direnv hook zsh)"; fi
if (( $+commands[pyenv] )); then eval "$(pyenv init -)"; fi

# asdf
if (( $+commands[asdf] )); then
  source /usr/local/opt/asdf/asdf.sh
fi
