if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
starship init fish | source
set -ga fish_user_paths /home/dev-vons/.nimble/bin
export EDITOR="nvim"
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.cache/rebar3/bin $PATH
set -x PATH /usr/local/go/bin/ $PATH
set -x PATH ~/.config/emacs/bin $PATH
set -x KITTY_DISABLE_WAYLAND 1
alias ls='ls --color=auto'
alias fls='ls | lolcat'

alias vim='nvim'
# alias clock='tty-clock -s -S -c -C 4'
# alias music='ncmpcpp'

alias ls="exa"
alias cat="bat"
alias j="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
#colorscript random
#pokemon-colorscripts --no-title -r


eval (opam env --switch=default)

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/dev-vons/.ghcup/bin # ghcup-env

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/dev-vons/.local/share/coursier/bin"
# <<< coursier install directory <<<
