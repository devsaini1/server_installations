#!/bin/bash -xe

# Log all output to a file
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Install Ruby
sudo apt install -y ruby

# Update package lists
sudo apt-get update

# Install gdebi-core
sudo apt-get install -y gdebi-core

# Download and install the AWS CodeDeploy agent
cd /tmp
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

# Check the status of the CodeDeploy agent service
sudo systemctl status codedeploy-agent

# Review the CodeDeploy agent logs for any errors
cat /var/log/aws/codedeploy-agent/codedeploy-agent.log

# Fetch and print the user data log
cat /var/log/user-data.log

echo "Hello from user data!" > /tmp/user_data_output.txt
