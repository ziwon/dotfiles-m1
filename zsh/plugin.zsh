
# Ref: http://zdharma.org/zinit/wiki/GALLERY/

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit id-as'z-a-rust' light-mode for zinit-zsh/z-a-rust
zinit id-as'z-a-as-monitor' light-mode for zinit-zsh/z-a-as-monitor
zinit id-as'z-a-patch-dl' light-mode for zinit-zsh/z-a-patch-dl
zinit id-as'z-a-bin-gem-node' light-mode for zinit-zsh/z-a-bin-gem-node

# theme
zinit ice depth=1 lucid id-as'p10k'
zinit light romkatv/powerlevel10k

zinit ice id-as'base16-shell' atload"base16_${BASE16_THEME}"
zinit light chriskempson/base16-shell

zinit ice id-as 'base16-fzf' lucid wait \
  src'bash/base16-${BASE16_THEME}.config' \
  pick'bash/base16-${BASE16_THEME}.config' \
  nocompile'!'
zinit light nicodebo/base16-fzf

# auto suggestions
zinit ice wait lucid id-as'zsh-autosuggestions' \
  atload'!_zsh_autosuggest_start'
zinit load zsh-users/zsh-autosuggestions

# history-search-multi-word
zinit ice wait'0a' lucid id-as'history-search-multi-word'
zinit load zdharma/history-search-multi-word

# history-substring-search
zinit ice wait'0b' lucid id-as'history-substring-search'
zinit light zsh-users/zsh-history-substring-search

# fast-syntax-highlighting
zinit ice wait'0c' lucid id-as'fast-syntax-highlighting' \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# completion
zinit ice wait blockf lucid id-as'zsh-completions' \
  atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# fzf
zinit ice wait'0a' lucid id-as'fzf-shell'
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'

# fzf tab
zinit ice wait'0a' lucid id-as'fzf-tab' has'fzf'
zinit light Aloxaf/fzf-tab

# kube-fzf
zinit ice wait'0b' lucid id-as'kubectl'
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh

zinit ice wait'0c' lucid id-as'kube-fzf'
zinit snippet 'https://raw.githubusercontent.com/bonnefoa/kubectl-fzf/master/kubectl_fzf.plugin.zsh'

# delta
zinit ice wait'0c' lucid id-as'delta' \
  from'gh-r' \
  as'command' \
  pick'delta/delta' \
  mv'delta* -> delta'
zinit light dandavison/delta

# z
zinit ice wait blockf lucid id-as'z'
zinit light rupa/z

# z tab completion
zinit ice wait lucid id-as'fz'
zinit light changyuheng/fz

# zsh-autopair
zinit ice wait lucid id-as'zsh-autopair'
zinit load hlissner/zsh-autopair

# alias tip
zinit ice wait lucid id-as'alias-tips'
zinit light djui/alias-tips

# cht.sh
zinit ice wait lucid id-as'cht.sh' \
  has'rlwrap' \
  pick'cht.sh' \
  atload'export CHTSH="$XDG_CONFIG_HOME"' \
  as'command'
zinit snippet https://cht.sh/:cht.sh

# cht-completion
zinit ice wait lucid id-as'cht-completion' \
  has'rlwrap' \
  mv'cht* -> _cht' \
  as'completion'
zinit snippet https://cheat.sh/:zsh

# poetry
zinit ice has='poetry' wait'0a' as='completion' id-as'poetry/completion' lucid \
  atclone='poetry completions zsh > _poetry' \
  atpull='%atclone'
zinit light zdharma/null

# eksctl
zinit ice wait'0b' lucid from"gh-r" pick='/dev/null' sbin \
  atclone='./eksctl completion zsh > _eksctl' \
  atpull='%atclone'
zinit light weaveworks/eksctl

# docker-compose
zinit ice wait'0c' lucid as'completion' \
  id-as'docker-compose-completion' mv'docker-compose-completion -> _docker-compose'
zinit snippet 'https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose'

# docker
zinit ice wait'0c' lucid as"completion" \
  id-as'docker-completion'
zinit snippet OMZ::plugins/docker/_docker

zinit ice lucid wait'0a' as'completion' blockf has'cargo'
zinit snippet https://raw.githubusercontent.com/rust-lang/cargo/master/src/etc/_cargo

zinit ice lucid wait'0a' as'completion' blockf has'rustc'
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/rust/_rust

# dog
zinit ice as='null' wait lucid from='gh-r' \
  sbin='bin/dog' \
  atclone='ln -sf completions/dog.zsh _dog' \
  atpull='%atclone'
zinit light ogham/dog

# doggo
zinit ice as='null' wait lucid from='gh-r' \
  sbin='doggo' \
  atclone='ln -sf completions/doggo.zsh _doggo' \
  atpull='%atclone'
zinit light mr-karan/doggo

# lazygit
zinit ice lucid wait as"program" from"gh-r" mv"lazygit* -> lazygit" id-as'lazygit'
zinit light 'jesseduffield/lazygit'

# git flow
#zinit ice lucid wait lucid id-as'poetry/completion'
    #'https://github.com/bobthecow/git-flow-completion/blob/master/git-flow-completion.zsh'

zinit ice wait'0c' lucid as"completion" id-as'git-flow-completion'
zinit snippet 'https://github.com/bobthecow/git-flow-completion/blob/master/git-flow-completion.zsh'

# term highlight
zinit ice pick"h.sh" id-as'hhighlighter'
zinit light paoloantinori/hhighlighter

# wakatime
#zinit ice wait"3" blockf lucid pick"wakatime.plugin.zsh" id-as'wakatime-zsh-plugin'
#zinit light "sobolevn/wakatime-zsh-plugin"

# map pages
zinit id-as'zsh-colored-man-pages' light-mode for ael-code/zsh-colored-man-pages
