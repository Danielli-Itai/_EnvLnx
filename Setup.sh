#!/bin/bash

#	Install git client and clone the environment repository.

#Start from home directory
cd ~/

echo 'GitSetup <param1> function installs the git client.'
echo 'param1 - git user name to set the git user and cache git password for 1 hour.'
function GitSetup()
{
  sudo apt-get update
  sudo apt install git-all -y

  sudo git config --global user.name "Danielli-Itai"
  sudo git config --global credential.helper 'cache --timeout=3600'
}