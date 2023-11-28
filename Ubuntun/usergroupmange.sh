#!/bin/bash

# This script is used to manage user accounts on an Ubuntu system for a CyberPatriot competition.

# Function to create a new user account with a specified username and password.
create_user() {
    read -p "Enter the username: " username
    read -p "Enter the password: " password
    sudo useradd -m -p $(openssl passwd -1 $password) $username
    echo "User $username created successfully."
}

# Function to delete an existing user account based on a given username.
delete_user() {
    read -p "Enter the username to delete: " username
    sudo userdel -r $username
    echo "User $username deleted successfully."
}

# Function to list all user accounts on the system with their basic information.
list_users() {
    echo "List of all user accounts on the system:"
    echo "----------------------------------------"
    echo "USERNAME    USER ID    GROUP ID"
    echo "----------------------------------------"
    awk -F: '{printf "%-12s%-11s%s\n", $1, $3, $4}' /etc/passwd
}
# Will create groups

create_group() {
    read -p "Enter the group name: " groupname
    sudo groupadd $groupname
    echo "User $groupname created successfully."
}

# Main menu
while true; do
    echo "Select an option:"
    echo "1. Create a new user account"
    echo "2. Delete an existing user account"
    echo "3. List all user accounts"
    echo "4. Create a new group"
    echo "5. Delete an existing group"
    echo "6. List all groups"
    echo "7. Add a user to a group"
    echo "8. Remove a user from a group"
    echo "9. Change all passwords to a secure password"
    echo "10. Exit"
    read -p "Enter your choice: " choice
    case $choice in
    1) create_user ;;
    2) delete_user ;;
    3) list_users ;;
    4) create_group ;;
    5) remove_group ;;
    6) list_group ;;
    7) add_user_group ;;
    8) remove_user_group ;;
    9) change_all_password ;;
    10) exit ;;
    *) echo "Invalid choice. Please try again." ;;
    esac
done