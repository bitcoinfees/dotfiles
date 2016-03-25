function ppidchain -d 'Print the process parent chain: ppidchain <pid>'
    set pid $argv[1]
    while [ $pid -ne 1 ]
        ps aux -o pid $pid | grep -v USER
        set pid (ppid $pid)
    end
end
