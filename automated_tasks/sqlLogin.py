#!/usr/bin/env python3

import subprocess as sp

# Check if MySQL is already running
if sp.call(["mysqladmin", "ping"], stdout=sp.PIPE, stderr=sp.PIPE) == 0:
    print("MySQL is already running")
else:
    print("MySQL is NOT running")
    if sp.call(["sudo", "service", "mysql", "start"]) == 0:
        print("MySQL started successfully")
    else:
        print("Failed to start MySQL")
        exit(1)

# Prompt the user for MySQL credentials
mysqlUser = input("Enter MySQL username: ")
mysqlPassword = input("Enter MySQL password: ")

# # Validate the credentials
# try:
#     sp.check_call(
#         ["mysql", "-u", mysqlUser, "-p" + mysqlPassword, "-e", "SELECT 1"],
#         stdout=sp.PIPE,
#         stderr=sp.PIPE
#     )

# except sp.CalledProcessError:
#     print("Invalid MySQL user credentials")
#     exit(1)

# # Connect to MySQL
# sp.call(["mysql", "-u", mysqlUser, "-p" + mysqlPassword])
