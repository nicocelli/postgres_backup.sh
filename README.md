# How to use postgres_backup.sh
Script to backup your database postgress to AWS S3

## Step 1: Clone this repo
git clone https://github.com/nicocelli/postgres_backup.sh.git


## Step 2: Define Environment Variables
In folder postgres_backup, define your environment variables editing the db_backup_env.sh file

```
# db_backup_env.sh
export DB_HOST="your_db_host"
export DB_PORT="your_db_port"
export DB_NAME="your_db_name"
export DB_USER="your_db_user"
export DB_PASSWORD="your_db_password"
export BACKUP_DIR="/path/to/backup"
export S3_BUCKET="your_s3_bucket_name"
 ```

## Step 3: Make the Scripts Executables

```
chmod +x /path/to/db_backup_env.sh
chmod +x /path/to/db_backup.sh
```

## Step 4: Automate the Backup Process

You can automate this script using a cron job.

1. Edit the crontab:
```crontab -e```
2. Add a cron job (e.g., to run the script daily at 2 AM):
```0 2 * * * /path/to/db_backup.sh```


