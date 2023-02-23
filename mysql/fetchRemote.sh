# Load environment variables from .env file
#!/bin/bash
source .env

# Connect to the remote MySQL server
# mysql -h $MYSQL_REMOTE_HOST -u $MYSQL_REMOTE_USERNAME -p$MYSQL_REMOTE_PASSWORD

# Dump the remote database to a file
mysqldump -h $MYSQL_REMOTE_HOST -P $MYSQL_REMOTE_PORT -u $MYSQL_REMOTE_USERNAME -p$MYSQL_REMOTE_PASSWORD $MYSQL_REMOTE_DATABASE --single-transaction  --set-gtid-purged=OFF | pv > database_backup.sql