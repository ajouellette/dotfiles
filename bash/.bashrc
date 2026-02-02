# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/.cargo/bin:" ]]
then
    PATH="$HOME/.cargo/bin:$PATH"
fi
export PATH

# set editor to nvim with vim as fallback
if command -v nvim &> /dev/null; then
    editor=nvim
else
    if command -v vim &> /dev/null; then
        editor=vim
    else
        editor=vi
    fi
fi
export EDITOR=$editor
export VISUAL=$editor
unset editor

# History
shopt -s histappend
export HISTCONTROL=ignoreboth

shopt -s checkwinsize

PS1='\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
