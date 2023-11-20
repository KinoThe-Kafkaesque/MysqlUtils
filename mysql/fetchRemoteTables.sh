#!/bin/bash
source .env

# List of tables you want to dump
tables_to_dump="feature permission role role_permission pricing"

# Dump the remote database to a file for specific tables
mysqldump -h $MYSQL_REMOTE_HOST -P $MYSQL_REMOTE_PORT -u $MYSQL_REMOTE_USERNAME -p$MYSQL_REMOTE_PASSWORD $MYSQL_REMOTE_DATABASE $tables_to_dump "$@" --single-transaction --set-gtid-purged=OFF | pv > database_seed.sql
