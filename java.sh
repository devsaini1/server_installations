#!/bin/bash

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "Java is not installed. Proceeding with installation..."
    
    # Install default JRE and JDK
    sudo apt update
    sudo apt install default-jre -y
    sudo apt install default-jdk -y

    # Add JAVA_HOME to bashrc
    echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> ~/.bashrc
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc
    source ~/.bashrc
    
    echo "Java has been installed successfully."
    echo "JAVA_HOME=$(readlink -f $(which java))"
else
    echo "Java is already installed."
    echo "JAVA_HOME=$(readlink -f $(which java))"
fi
