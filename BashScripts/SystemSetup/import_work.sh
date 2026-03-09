#!/bin/bash

# Check if the file exists
if [ ! -f "work.txt" ]; then
    echo "Error: work.txt not found."
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
done < "works.txt"

echo "Done! Variables are set for this session."
