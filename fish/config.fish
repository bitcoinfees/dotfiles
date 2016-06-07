set fish_greeting ""
set -x EDITOR vim
set -x FISH_HOME $HOME/.config/fish

function dh
    dirh
end

function gs
    git status $argv
end

function gd
    git diff $argv
end

function gb
    git branch $argv
end

function gl
    git log $argv
end

function grep
    command grep --color=auto $argv
end

function gentags
    ctags -R .
end

function gengotags
    gotags -R . > tags
end

source $FISH_HOME/fishmarks/marks.fish
source $FISH_HOME/local.fish

function fish_user_key_bindings
    bind \el nextd-or-forward-word
    bind \eh prevd-or-backward-word
end
