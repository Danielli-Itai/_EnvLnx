#!/bin/bash

#	Install git client and clone the environment repository.

#Start from home directory
cd ~/

echo 'GitSetup <param1> <param2> function installs the git client.'
echo 'param1 - git user name to set the git user'
echo 'param2 - git user email address'
# and cache git password for 1 hour.'
function GitSetup()
{
  # Install Github.
  sudo apt-get update
  sudo apt install git-all -y

  echo 'Git password ?'
  read pass
  # Set global credentials.
  sudo git config --global user.name $1
	sudo git config --global user.email $2
	sudo git config --global user.password $pass

#  sudo git config --global credential.helper 'cache --timeout=3600'
}
