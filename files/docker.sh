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
echo -e '{' > /etc/docker/daemon.json
echo -e '    "registry-mirrors": [' >> /etc/docker/daemon.json
echo -e '        "https://registry.docker-cn.com",' >> /etc/docker/daemon.json
echo -e '        "http://hub-mirror.c.163.com"' >> /etc/docker/daemon.json
echo -e '    ],' >> /etc/docker/daemon.json
echo -e '    "dns": ["8.8.8.8","8.8.4.4"]' >> /etc/docker/daemon.json
echo -e '}' >> /etc/docker/daemon.json
service docker restart
 
# verify that Docker Engine is installed correctly
sudo docker run hello-world