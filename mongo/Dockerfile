FROM mongo:3.4

# Add run.sh and set_mongodb_password.sh to container
ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

# Run bash script
CMD ["./run.sh"]