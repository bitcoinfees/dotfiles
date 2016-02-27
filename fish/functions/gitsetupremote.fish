function gitsetupremote
    set numargs (count $argv)
    if math "$numargs<2" > /dev/null
        echo "gitsetupremote <name> <remoteip>"; return
    end
    git clone --bare . $argv[1].git
    and rsync -aP $argv[1].git git@$argv[2]:.
    and git remote add origin ssh://git@$argv[2]/home/git/$argv[1].git
    and echo "All OK"

    if [ -d $argv[1].git ]
        rm -rf $argv[1].git
    end
end
