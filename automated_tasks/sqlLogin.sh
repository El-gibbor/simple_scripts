#!/bin/env bash

mysql_user="$1"
# Check if MySQL server is already running
if mysqladmin ping &>/dev/null; then
    echo "MySQL is already running"
else
    echo "MySQL is NOT running"
    if sudo service mysql start; then
        echo "MySQL started successfully"
    else
        echo "Failed to start MySQL"
        exit 1
    fi
fi
# Prompt the user for MySQL credentials
read -s -p "Enter MySQL password: " mysql_password
echo ""

# Validate the credentials
if ! mysql -u "$mysql_user" -p"$mysql_password" -e "SELECT 1" &>/dev/null
then
    echo "Invalid MySQL credentials"
    exit 1
fi
# Connect to MySQL server
mysql -u "$mysql_user" -p"$mysql_password"


# Check if MySQL is already running
# if mysqladmin ping &>/dev/null;
# then
#     echo "MySQL is already running"
# else
#     echo "MySQL is NOT running"
#     sudo service mysql start
# fi

# # Connect to MySQL
# mysql -u elgibbor -p
