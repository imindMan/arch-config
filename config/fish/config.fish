if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
starship init fish | source
set -ga fish_user_paths /home/dev-vons/.nimble/bin
export EDITOR="nvim"
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.cache/rebar3/bin $PATH
alias ls='ls --color=auto'
alias fls='ls | lolcat'

alias vim='nvim'
alias clock='tty-clock -s -S -c -C 4'
alias music='ncmpcpp'

alias ls="exa"
alias cat="bat"
alias j="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
#colorscript random
#pokemon-colorscripts --no-title -r



