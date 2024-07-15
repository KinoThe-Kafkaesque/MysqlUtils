#!/bin/bash

# Load environment variables
export $(grep -v '^#' .env | xargs)

# Set PGPASSWORD
export PGPASSWORD=$POSTGRES_REMOTE_PASSWORD

# Run pg_dump
pg_dump -h $POSTGRES_REMOTE_HOST -p $POSTGRES_REMOTE_PORT -U $POSTGRES_REMOTE_USERNAME -d $POSTGRES_REMOTE_DATABASE > backup.sql

# Unset PGPASSWORD for security
unset PGPASSWORD