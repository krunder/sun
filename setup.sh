#!/bin/bash

set -e

echo "Setting up..."
sudo apt update

path=$( dirname "$0" )
files=( "$path/scripts/"*.sh )

# Check if any .sh files exist
if [ ${#files[@]} -eq 0 ] || [ ! -f "${files[0]}" ]; then
    echo "No .sh files found in $path/scripts/" >&2
    exit 1
fi

for file in "${files[@]}"; do
    echo "Running: $(basename $file)"
    bash "$file"
    if [ $? -ne 0 ]; then
        echo "Error: $file failed to execute" >&2
    fi
done

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt clean -y
