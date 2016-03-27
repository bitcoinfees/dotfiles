function sshsocks -d "socks on port 1080: sshsocks <args>" --wraps ssh
    ssh -ND 1080 $argv
end
