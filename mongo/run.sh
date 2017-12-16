#!/bin/bash
set -m

# Bootstrap mongodb. Set storage engine etc
cmd="mongod --storageEngine wiredTiger --rest --httpinterface --master --auth"
 
$cmd &

# If set_mongodb_password.sh file does not exist, 
# then run the file to create admin and app database user
if [ ! -f ./data/db/.mongodb_password_set ]; then
    ./set_mongodb_password.sh
fi
 
fg