#!/bin/bash

# Check if a file was passed as an argument
if [ -z "$1" ]; then
    echo "Please provide a file as an argument"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found"
    exit 1
fi

# Read the file and install the packages
while read line; do
    # Check if the line starts with "apt"
    if [[ $line == apt* ]]; then
        # Install the package
        apt-get install -y ${line#apt}
    fi

    # Check if the line starts with "flatpak"
    if [[ $line == flatpak* ]]; then
        # Install the package
        flatpak install -y ${line#flatpak}
    fi

    # Check if the line starts with "python"
    if [[ $line == python* ]]; then
        # Install the package
        pip install ${line#python}
    fi

    # Check if the line starts with "node"
    if [[ $line == node* ]]; then
        # Install the package
        npm install -g ${line#node}
    fi
done < $1
