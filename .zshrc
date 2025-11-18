setopt interactivecomments
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY

bindkey -v
bindkey '^R' history-incremental-search-backward

export EDITOR='/usr/bin/vim'
alias ls='ls --color'
alias grep='grep --color'
