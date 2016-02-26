fish_vi_mode
set fish_greeting ""
set -x EDITOR vim

function gs
    git status $argv
end

function gd
    git diff $argv
end

function grep
    command grep --color=auto $argv
end

function pycd
    cd (python -c "import $argv[1]; import os; \
    print(os.path.dirname($argv[1].__file__))")
end

function dockerclean
    docker rm -v (docker ps --filter status=exited -q ^ /dev/null) ^ /dev/null
    docker rmi (docker images --filter dangling=true -q ^ /dev/null) ^ /dev/null
end

function gentags
    ctags -R .
end

function gengotags
    gotags -R . > tags
end

source $HOME/.config/fish/extras.fish
