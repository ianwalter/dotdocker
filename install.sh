#!/bin/bash

# Update repository cache.
sudo apt update

# Install packages that let apt use packages over HTTPS.
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker GPG key.
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add Docker repository to apt sources.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Update the package database now that the Docker repo has been added.
sudo apt update

# Install Docker.
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add user to docker group.
if [[ $(cat /etc/group | grep docker) == '' ]]; then
  sudo usermod -a -G docker $USER
fi
