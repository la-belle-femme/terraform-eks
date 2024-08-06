#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install necessary dependencies
sudo apt-get install -y curl unzip

# Download the AWS CLI installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer
unzip awscliv2.zip

# Run the installer
sudo ./aws/install

# Verify the installation
aws --version

# Clean up the installation files
rm -rf awscliv2.zip aws

echo "AWS CLI installation completed successfully."

