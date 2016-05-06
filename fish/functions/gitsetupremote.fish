function gitsetupremote
    set numargs (count $argv)
    if math "$numargs<2" > /dev/null
        echo "gitsetupremote <name> <remoteip> [remote name]"; return
    end
    if math "$numargs>2" > /dev/null
        set remotename $argv[3]
    else
        echo 'Remote name not specified, defaulting to "origin"'
        set remotename origin
    end
    git clone --bare . $argv[1].git
    and rsync -aP $argv[1].git git@$argv[2]:.
    and git remote add $remotename ssh://git@$argv[2]/home/git/$argv[1].git
    and echo "All OK"

    if [ -d $argv[1].git ]
        rm -rf $argv[1].git
    end
end
