alias ls='ls -G'
alias grep='grep --color'
alias n='ncmpcpp'
alias pw='pwgen -s 25'


#pretty prompt colors
#PS1='[\u@\h \W]\$ '
#with this if statement, a -686 will be appended to the bash prompt if I'm in my i686 schroot
if uname -a|grep 686; then
        PS1='\[\033[0;32m\]\u\[\033[0;37m\]@\[\033[0;32m\]\h-686\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$ '
else
        PS1='\[\033[0;32m\]\u\[\033[0;37m\]@\[\033[0;32m\]\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$ '
fi
#PS1='\[\e[0;32m\]\u\[\e[0;37m\]@\[\e[0;32m\]\h\[\e[0;37m\]\e[1m-Arch32:\[\e[01;34m\]\W\[\e[00m\]\$ '

# If this is an xterm set the title to working directory
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"
    ;;
*)
    ;;
esac


# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export HISTSIZE=15000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#tab-complete sudo commands
complete -cf sudo

mkcd() { mkdir -p "$@" && cd "$_"; }

alias fix-ssh='export SSH_AUTH_SOCK=$(ls -dtr $(find $(find /tmp/ -maxdepth 1 -user $(whoami) -name "ssh-*" ) -name "agent*" )|tail -n1)'

alias diff="diff -W \`stty size | awk {'print \$2'}\`"


# Append history to .bash_history rather than overwrite it.
shopt -s histappend

#man page colors
man() {
        env \
                LESS_TERMCAP_mb=$(printf "\e[01;31m") \
                LESS_TERMCAP_md=$(printf "\e[01;31m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[01;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[01;32m") \
                        man "$@"
}


set -o vi
bind -m vi-insert "\C-l":clear-screen

# completion for tmux session names --from freedrull
function _tmux_complete_session() {
  local cur
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "$(tmux ls | cut -f 1 -d ':')" -- "${cur}") )
}
complete -F _tmux_complete_session tmux a -t



# GitHub
alias yon="osascript -e 'tell application \"yubiswitch\" to KeyOn'"
alias yoff="osascript -e 'tell application \"yubiswitch\" to KeyOff'"

PERL_MB_OPT="--install_base \"/Users/jonahberquist/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jonahberquist/perl5"; export PERL_MM_OPT;
eval "$(rbenv init -)"

export GOPATH=${HOME}/dev/go

