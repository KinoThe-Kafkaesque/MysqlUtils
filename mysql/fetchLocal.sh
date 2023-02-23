# Load environment variables from .env file
#!/bin/bash
source .env

# Connect to the LOCAL MySQL server
# mysql -h $MYSQL_LOCAL_HOST -u $MYSQL_LOCAL_USERNAME -p$MYSQL_LOCAL_PASSWORD

# Dump the LOCAL database to a file
mysqldump -h $MYSQL_LOCAL_HOST -P $MYSQL_LOCAL_PORT -u $MYSQL_LOCAL_USERNAME -p$MYSQL_LOCAL_PASSWORD $MYSQL_LOCAL_DATABASE --single-transaction --set-gtid-purged=OFF | pv > database_backup_local.sql