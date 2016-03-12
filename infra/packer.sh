
#!/bin/bash -eu

# install basic packages
#
sudo apt-get update -y
sudo apt-get install -y git bzr mercurial wget telnet curl rake python python-pip unzip

# install docker
#
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
cat <<EOF | sudo tee -a /etc/apt/sources.list.d/docker.list
deb https://apt.dockerproject.org/repo ubuntu-trusty main
EOF
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-cache policy docker-engine
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y apparmor
sudo apt-get install -y docker-engine
sudo usermod -aG docker ubuntu

# install awscli
#
sudo pip install --upgrade awscli

