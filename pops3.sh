#!/bin/bash

# Log file path
log_file="script_log.txt"

# Function to log messages to the file
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

# Function to display file change with a delay
display_file_change() {
    echo "Changing permissions for file: $1"
    sleep 1  # Delay of 1 second between each file change
}

# Prompt user for directory path
read -p "Enter directory path: " dir_path
log_message "User entered directory path: $dir_path"

# Prompt user for permissions number
read -p "Enter permissions number (e.g., 777): " permissions
log_message "User entered permissions number: $permissions"

# Navigate to the directory
cd "$dir_path" || { log_message "Failed to navigate to directory: $dir_path"; exit 1; }
log_message "Navigated to directory: $dir_path"

# Change permissions of all files in the directory
for file in *; do
    if [ -f "$file" ]; then
        chmod "$permissions" "$file" && display_file_change "$file"
    fi
done
log_message "Changed permissions to $permissions for all files in directory"

# Print directory contents and permissions
log_message "Directory contents:"
ls -l "$dir_path" >> "$log_file"



