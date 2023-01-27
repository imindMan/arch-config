#
# ~/.bashrc
#
export PATH=~/.local/bin:$PATH
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias clock='tty-clock -s -S -c -C 4'
alias music='ncmpcpp'
eval "$(starship init bash)"