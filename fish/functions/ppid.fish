function ppid -d "Get the PPID from the PID"
    ps -o ppid= -p $argv[1]
end
