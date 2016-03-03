function dockerclean
    docker rm -v (docker ps --filter status=exited -q ^ /dev/null) ^ /dev/null
    docker rmi (docker images --filter dangling=true -q ^ /dev/null) ^ /dev/null
end
