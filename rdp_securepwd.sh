#!/bin/bash

# Ask for the IP address or hostname of the remote computer
read -p "Enter the IP address or hostname of the remote computer: " server

# Ask for the domain
read -p "Enter the domain (leave blank if not applicable): " domain

# Ask for the username
read -p "Enter the username: " username

# Ask for the password securely
read -sp "Enter the password: " password
echo

# Construct the xfreerdp command
if [ -z "$domain" ]; then
    # If domain is empty, do not include the /d option
    command="xfreerdp /v:$server /u:$username /p:$password /cert-ignore"
else
    # If domain is provided, include the /d option
    command="xfreerdp /v:$server /d:$domain /u:$username /p:$password /cert-ignore"
fi

# Ask for confirmation before executing the command
read -p "Do you want to execute the command? (Y/N): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "Connecting to $server with user $username..."
    $command
else
    echo "Operation canceled."
fi
