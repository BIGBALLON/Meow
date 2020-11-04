#!/bin/bash

# uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# update the apt package index and install packages
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
 
# add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install docker engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
 
# change docker source [optional]
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
      "https://registry.docker-cn.com",
      "https://docker.mirrors.ustc.edu.cn"
  ]
}
EOF
sudo service docker restart

# verify that Docker Engine is installed correctly
sudo docker run hello-world