# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
#export HISTCONTROL=ignoreboth

export HISTCONTROL=ignoreboth:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#unset HISTFILE
#export HISTFILE=/dev/null
export HISTSIZE=1000
export HISTFILESIZE=1000
#export HISTIGNORE="mc:mocp:cd*:mkdir*:md*:rm*:rmdir*:cp*:mv*:dox:dl:wget*:./*:cat*:vim*:ls*:fortune:chmod*:man*:&"
export HISTIGNORE="&"


# append to the history file, don't overwrite it
shopt -s histappend

#smart handling of multi-line commands
shopt -s cmdhist

#export PROMPT_COMMAND='history -a'
#export PROMPT_COMMAND="history -a;history -r;$PROMPT_COMMAND"

shopt -s cdspell


# If you want to stop bash from creating a history file simply add 
#export HISTFILE=/dev/null 
# to your .bashrc.

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u\[\033[00m\]@\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]cwd: \[\033[00m\]\[\033[01;34m\]\W\[\033[00m\] $ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
    #PS1='${debian_chroot:+($debian_chroot)}cwd: \W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh

# make bash autocomplete with up arrow  
bind '"\e[A":history-search-backward'  
bind '"\e[B":history-search-forward'  

# make tab cycle through commands instead of listing  
#bind '"\t":menu-complete'

# Changing default behaviour of some commands
alias mplayer='mplayer -fs -really-quiet -subfont-text-scale 3 -vf screenshot'
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias wget="wget -c -t 0"
alias wget-site="wget -rEkp -np -c -t 0"
alias diff="colordiff"

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'

alias pysmtpd='python -m smtpd -n -c DebuggingServer localhost:1025'
alias find_duplicates='/home/sanya/dev/Python/find_duplicates.py'
alias pydict='/home/sanya/dev/Python/pydict.py'
alias timidity_server='timidity -iA -B2,8 -Os1l -s 44100'
alias sml='rlwrap sml'


export EDITOR=/usr/bin/vim
#export MANPAGER=/usr/bin/most


extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
            fi
}


