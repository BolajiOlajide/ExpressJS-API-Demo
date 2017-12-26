#!/bin/bash
if [ $? -eq 0 ]
then
    docker info 3>null 1>null 2>null
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