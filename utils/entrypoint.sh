#!/bin/bash

# Setup a cron schedule
echo "* * * * * /usr/bin/python3.7 /cleanup_files.py >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

echo "Cron job is running..."

crontab scheduler.txt
cron -f

