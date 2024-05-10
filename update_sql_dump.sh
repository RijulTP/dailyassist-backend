#!/bin/bash

# Fetch environment variables
username=$DB_USER
password=$DB_PASSWORD

# Execute the MySQL command
mysqldump -u "$username" -p"$password" DailyAssist > Materials/DailyAssist.sql


