# disable xon/xoff control
stty -ixon

# zsh settings
unsetopt case_glob
setopt globdots
setopt extendedglob
setopt autocd

# smart url

# generals
setopt brace_ccl
setopt combining_chars
setopt rc_quotes
unsetopt mail_warning

# jobs
setopt long_list_jobs
setopt auto_resume
setopt notify
unsetopt bg_nice
unsetopt hup
unsetopt check_jobs

setopt correct

# completion
setopt complete_in_word
setopt always_to_end
setopt path_dirs
setopt auto_menu
setopt auto_list
setopt auto_param_slash
setopt no_complete_aliases

setopt menu_complete
unsetopt flow_control

# history
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=1000000000
SAVEHIST=5000
setopt appendhistory notify
unsetopt beep nomatch

setopt bang_hist
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify
setopt extended_history

# themes
setopt promptsubst
