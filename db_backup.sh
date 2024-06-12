#!/bin/bash

# Source the environment variables
source db_backup_env.sh

# Variables
BACKUP_FILE="$BACKUP_DIR/$(date +\%Y\%m\%d\%H\%M\%S)_$DB_NAME.dump"
S3_PATH="s3://$S3_BUCKET/$(basename $BACKUP_FILE)"

# Export the password so pg_dump can use it
export PGPASSWORD=$DB_PASSWORD

# Create the backup
pg_dump -h $DB_HOST -p $DB_PORT -U $DB_USER -Fc $DB_NAME -f $BACKUP_FILE

# Upload the backup to S3
aws s3 cp $BACKUP_FILE $S3_PATH

# Optionally, remove the local backup file after upload
rm $BACKUP_FILE

# Unset the password variable
unset PGPASSWORD
