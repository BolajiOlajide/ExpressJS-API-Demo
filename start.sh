#!/bin/bash
# stop all running instances of the containers
docker-compose down

# Start the application containers
docker-compose up 