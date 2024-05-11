#!/bin/bash

# Greet the user
USER=$(whoami)
echo "Hello $USER"

# Define COURSE_ID environment variable
export COURSE_ID="DevOpsFursa"


# Check .token file if exists
if [ -f ~/.token ]; then
    # Get the permissions of the .token file in octal format
    PERMISSIONS=$(stat -c %a ~/.token)
    # Check if permissions are not equal to 600
    if [ "$PERMISSIONS" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

# Set umask
umask 006

# Add ~/usercommands to PATH
PATH="$PATH:/home/$USER/usercommands"

# Print current date in ISO 8601 format
DATE=$(date --iso-8601=seconds)
echo "The current date is : $DATE"

# Define ltxt alias
alias ltxt="ls *.txt"

# Create or clean ~/tmp directory
if [ -d ~/tmp ]; then
    rm -rf ~/tmp/*
else
    mkdir ~/tmp
fi

# Kill process bound to port 8080 (if exists)
PID=$(lsof -t -i:8080)
if [ -n "$PID" ]; then
    kill $PID
fi

