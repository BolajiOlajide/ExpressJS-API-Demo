#!/bin/bash
 
# Database Admin User
MONGODB_ADMIN_USERNAME=${MONGODB_ADMIN_USERNAME:-"root"}
MONGODB_ADMIN_PASSWORD=${MONGODB_ADMIN_PASSWORD:-"password"}
 
# Application Database User
MONGODB_APP_DB=${MONGODB_APP_DB:-"UserManager"}
MONGODB_APP_USERNAME=${MONGODB_APP_USERNAME:-"usermanager"}
MONGODB_APP_PASSWORD=${MONGODB_APP_PASSWORD:-"password"}
 
# Wait for MongoDB to boot
RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MongoDB service startup..."
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done
 
# Create the admin user
echo "=> Creating admin user with a password in MongoDB"
mongo admin --eval "db.createUser({user: '$MONGODB_ADMIN_USERNAME', pwd: '$MONGODB_ADMIN_PASSWORD', roles:[{role:'root', db:'admin'}]});"
 
sleep 3
 
# If we've defined the MONGODB_APP_DB environment variable and it's a different database
# than admin, then create the user for that database.
# First it authenticates to Mongo using the admin user it created above.
# Then it switches to the REST API database and runs the createUser command 
# to actually create the user and assign it to the database.
if [ "$MONGODB_APP_DB" != "admin" ]; then
    echo "=> Creating an ${MONGODB_APP_DB} user with a password in MongoDB"
    mongo admin -u $MONGODB_ADMIN_USERNAME -p $MONGODB_ADMIN_PASSWORD << EOF
use $MONGODB_APP_DB
db.createUser({user: '$MONGODB_APP_USERNAME', pwd: '$MONGODB_APP_PASSWORD', roles:[{role:'dbOwner', db:'$MONGODB_APP_DB'}]})
EOF
fi
 
sleep 1
 
# If everything went well, add a file as a flag so we know in the future to not re-create the
# users if we're recreating the container (provided we're using some persistent storage)
echo "=> Done!"
touch ./data/db/.mongodb_password_set
 
echo "========================================================================"
echo "You can now connect to the admin MongoDB server using:"
echo ""
echo "    mongo admin -u $MONGODB_ADMIN_USERNAME -p $MONGODB_ADMIN_PASSWORD --host <host> --port <port>"
echo ""
echo "Please remember to change the admin password as soon as possible!"
echo "========================================================================"
