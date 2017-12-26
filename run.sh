#!/bin/bash
# this ensures that if there were any errors that occured previously, then the code won't run #
if [ $? -eq 0 ]
then
# this is to ensure that docker is running in the local machine #
    docker info 3>/dev/null 1>/dev/null 2>/dev/null
    if [ $? -eq 0 ]
    then
        echo "docker existing"
        echo "clean up"
        docker-compose down
        docker-compose up --build
    else
        echo "make sure docker is installed and running"
    fi
else
    echo "install docker" >&2
fi