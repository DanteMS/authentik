#!/bin/bash -x
# Setup docker & compose
curl -fsSL https://get.docker.com | bash
sudo usermod -a -G docker ubuntu
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# Setup nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g yarn
# Setup python
sudo apt install -y python3.8 python3-pip libxmlsec1-dev pkg-config
# Setup docker
sudo pip3 install pipenv

cd e2e
sudo docker-compose up -d
cd ..
pipenv sync --dev
pipenv shell
