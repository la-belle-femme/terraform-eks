#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install necessary dependencies
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list to include Docker packages
sudo apt-get update

# Install Docker and its components
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker service and enable it to start at boot
sudo systemctl start docker
sudo systemctl enable docker

# Add the ubuntu user to the Docker group
sudo usermod -aG docker ubuntu

# Print Docker version to verify installation
docker --version
