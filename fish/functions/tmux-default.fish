function tmux-default
    if set -q TMUX
        echo "Already in tmux." >&2
        return 1
    end
    if not tmux a -t default ^ /dev/null
        tmux new -s default
    end
end
