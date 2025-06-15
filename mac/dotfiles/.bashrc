#!/usr/bin/env bash

shopt -s autocd # cd without cd
HISTSIZE= HISTFILESIZE= # infinite history
export EDITOR="nvim" # set neovim as default editor
#export LANG=C # fix locale in vim
export TERM=xterm-256color # color support for terminal

# source aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# set path for homebrew ARM binaries
export PATH="/opt/homebrew/bin:${PATH}"
export PATH="/opt/homebrew/sbin:${PATH}"

# make coreutils available
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"

# prompt
export PS1="\[$(tput setaf 0)\]\w \[$(tput setaf 1)\]$ \[$(tput sgr0)\]"

. $(brew --prefix)/etc/profile.d/z.sh # z directory jumping

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
