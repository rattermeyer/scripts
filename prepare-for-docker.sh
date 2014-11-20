#!/bin/bash
USER="My Name"
EMAIL="my_name@domain.local"
echo "installing packages"
apt-get install -y git tmux vim python-pip python-dev
git config --global user.name "${USER}"
git config --global user.email ${EMAIL}
git config --global core.editor vim
echo "installing ansible"
pip install -U ansible
echo "installing docker + fig"
curl -sSL https://get.docker.com/ubuntu/ | sh 
pip install -U fig
