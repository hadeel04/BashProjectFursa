#!/bin/bash

# Greet the user
USER=$(whoami)
echo "Hello $USER"

# Define COURSE_ID environment variable
export COURSE_ID="DevOpsFursa"


# Check .token file permissions
if [ -f ~/.token ]; then
    if [ $(stat -c "%a" ~/.token) != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi


# Print current date in ISO 8601 format
DATE=$(date --iso-8601=seconds)
echo "The current date is : $DATE"


exit 0