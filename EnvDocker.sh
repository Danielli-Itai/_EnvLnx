#!/bin/bash
#Keep linux End of line conversion.
#Based on: https://docs.docker.com/
echo "Docker environment: DockerUninstall, DockerUninstall, DockerInfo."





# Update the apt package index and install packages to allow apt to use a repository over HTTPS.
#https://docs.docker.com/engine/install/ubuntu/
function DockerInstall()
{
	#Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version
	sudo apt-get update
	
	#Update the apt package index and install packages to allow apt to use a repository}
	sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	
	#Add Docker’s official GPG key.
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	
	#Verify that you now have the key with the fingerprint by searching for the last 8 characters of the fingerprint.
	sudo apt-key fingerprint 0EBFCD88
	
	#set up the stable repository.
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	
	#Update the apt package index, and install the latest version of Docker Engine and containerd.
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io
}

#Uninstall docker.
function DockerUninstall()
{
	#Uninstall the Docker Engine, CLI, and Containerd packages.
	sudo apt-get purge docker-ce docker-ce-cli containerd.io
	
	#Delete all images, containers, and volumes.
	sudo rm -rf /var/lib/docker
}


#Show docker information.
function DockerInfo()
{
	sudo docker info
	sudo docker --version
}


function DockerTest()
{
	docker run hello-world
}


function DockerImages()
{
	echo 'Docker immanges'
	sudo docker image ls
	
	echo echo 'Docker instances'
	sudo docker ps --all
}