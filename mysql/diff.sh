#!/bin/bash
# Load environment variables from .env file
source .env

# Check if a table name was provided as an argument
if [ $# -eq 1 ]; then
    TABLE_TO_DUMP=" $1"
else
    TABLE_TO_DUMP=""
fi

# Dump remote database schema
mysqldump -h $MYSQL_REMOTE_HOST -u $MYSQL_REMOTE_USERNAME -p$MYSQL_REMOTE_PASSWORD -P $MYSQL_REMOTE_PORT --set-gtid-purged=OFF --single-transaction --no-data --skip-comments --databases $MYSQL_REMOTE_DATABASE$TABLE_TO_DUMP > remote_db.sql

# Dump local database schema
mysqldump -h $MYSQL_LOCAL_HOST -u $MYSQL_LOCAL_USERNAME -p$MYSQL_LOCAL_PASSWORD -P $MYSQL_LOCAL_PORT --set-gtid-purged=OFF --single-transaction --no-data --skip-comments --databases $MYSQL_LOCAL_DATABASE$TABLE_TO_DUMP > local_db.sql

# Compare schemas and output the diff to a file
diff -u remote_db.sql local_db.sql > diff.sql