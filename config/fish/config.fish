if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
starship init fish | source

export EDITOR="nvim"
set -x PATH ~/.local/bin $PATH
alias ls='ls --color=auto'
alias fls='ls | lolcat'

alias clock='tty-clock -s -S -c -C 4'
alias music='ncmpcpp'

alias ls="exa"
alias vim="nvim"
~/.config/bspwm/random.sh
#colorscript random
#pokemon-colorscripts --no-title -r
