#!/bin/sh

# Where $ENVSUBS is whatever command you are looking to run
#$ENVSUBS < fil1 > file2

npm install

# This will exec the CMD from your Dockerfile, i.e. "npm start"
exec "$@"