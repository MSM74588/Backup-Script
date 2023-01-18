#!/bin/bash

# Get the current date and time
now=$(date +"%Y-%m-%d_%H-%M-%S")

# Create a file with the current date and time as its name
touch "$now"_backup.txt

# Get a list of installed apt packages and write them to the file
echo "APT Packages:" >> "$now"_backup.txt
apt list --installed >> "$now"_backup.txt

# Get a list of installed flatpak packages and write them to the file
echo "Flatpak Packages:" >> "$now"_backup.txt
flatpak list >> "$now"_backup.txt

# Get a list of installed Python packages and write them to the file
echo "Python Packages:" >> "$now"_backup.txt
pip freeze >> "$now"_backup.txt

# Get a list of installed Node.js packages and write them to the file
echo "Node.js Packages:" >> "$now"_backup.txt
npm list --depth=0 -g >> "$now"_backup.txt
