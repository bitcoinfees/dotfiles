function gitsetupremote
    if count $argv < 2
        echo "gitsetupremote <name> <remoteip>"; return
    git clone --bare . $argv[1].git
    and rsync -aP $argv[1].git git@$argv[2]:.
    and git remote add origin ssh://git@$argv[2]/home/git/$argv[1].git
    and rm -rf $argv[1].git
    and echo "All OK"
end
