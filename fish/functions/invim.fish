function invim -d "Check if this shell was forked from vim."
    if set -q VIMRUNTIME
        echo "yes!"
    else
        echo "no!"
    end
end
