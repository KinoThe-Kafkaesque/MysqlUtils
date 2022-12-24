# Load environment variables from .env file
#!/bin/bash
source .env
# Drop the local database
mysql -u $MYSQL_LOCAL_USERNAME -p$MYSQL_LOCAL_PASSWORD -e "DROP DATABASE $MYSQL_LOCAL_DATABASE;"
# Create the local database
mysql -u $MYSQL_LOCAL_USERNAME -p$MYSQL_LOCAL_PASSWORD -e "CREATE DATABASE $MYSQL_LOCAL_DATABASE;"
# Restore the remote database into the local database
pv database_backup.sql | mysql -u $MYSQL_LOCAL_USERNAME -p$MYSQL_LOCAL_PASSWORD $MYSQL_LOCAL_DATABASE 