#!/bin/bash

# Check if the file exists
if [ ! -f "vars.txt" ]; then
    echo "Error: vars.txt not found."
    exit 1
fi

# Read the file line by line
while IFS='=' read -r key value
do
    # Skip empty lines or lines that don't have a value
    if [[ -n "$key" && -n "$value" ]]; then
        # Export the variable to the current session
        export "$key=$value"
        echo "Imported: $key"
    fi
done < "vars.txt"

echo "Done! Variables are set for this session."

# Now for additional environment tings

## Microsoft ODBC Driver
# curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc

# curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

# sudo apt-get update

# sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools unixodbc-dev
#

git config user.email carter.gordon@usiouxfalls.edu
