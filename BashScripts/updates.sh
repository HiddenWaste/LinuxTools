#!/bin/bash

# This file is to be used in a parent folder of a bunch of repos
echo "Warning: This script will automatically perform git pulls"

# Iterate through every item in the current directory
for d in */ ; do
    # Check if the subdirectory contains a .git folder
    if [ -d "$d/.git" ]; then
        echo "Updating $d..."
        
        # Move into the directory, pull, and return back
        (cd "$d" && git pull)
    else
        echo "Skipping $d (not a git repo)"
    fi
done

echo "Everything should be up to date!"
