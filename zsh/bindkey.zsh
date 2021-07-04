# vim mode
bindkey -v
bindkey '^K' kill-whole-line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^D' delete-char
bindkey '^F' forward-char
bindkey '^B' backward-char

# bind Alt+. to insert last argument of last command
bindkey -M viins '\e.' insert-last-word

# # Using Ctrl-Space for quick execute suggest command
bindkey '^ ' autosuggest-execute

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
