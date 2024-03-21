#!/bin/bash

# Function to check if a package is installed
check_installed() {
    if dpkg -s "$1" &> /dev/null; then
        echo "$1 is already installed."
        return 0
    else
        return 1
    fi
}

# Function to run a command to confirm installation
confirm_installation() {
    if ! check_installed "$1"; then
        echo "Installing $1..."
        sudo apt-get install -y "$1"
        echo "$1 has been installed."
    fi
}

echo "Installing Dependencies..."

# List of dependencies to install
dependencies=("ca-certificates" "curl" "gnupg" "wget" "default-jre" "default-jdk" "openssh-server" "awscli" "python3" "python3-pip")

# Install dependencies and confirm their installation
for dependency in "${dependencies[@]}"; do
    if [[ "$dependency" == "default-jre" || "$dependency" == "default-jdk" ]]; then
        confirm_installation "$dependency"
    else
        confirm_installation "$dependency"
        # Run command to confirm installation if applicable
        case "$dependency" in
            "awscli")
                aws --version
                ;;
            "python3")
                python3 --version
                ;;
            "python3-pip")
                pip3 --version
                ;;
        esac
    fi
done

echo "All dependencies have been installed."
