#!/bin/bash
#Keep linux End of line conversion.
#Based on: https://docs.docker.com/





echo "Docker environment: DockerUninstall, DockerUninstall, DockerInfo, DockerTest, DockerImages, DockerRemove, DockerClear."
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
	sudo docker run hello-world
}





#https://docs.docker.com, https://docs.docker.com/engine/reference/commandline/images/
#-f ilter, -q only ID's, -a show all.
echo "Docker commands: DockerImages, DockerBuild, DockerRunInteractive, DockerRemove, DockerClear, DockerClearAll"
function DockerImages()
{
	echo 'Docker immanges'
	sudo docker image ls	
	echo
	echo 'Docker instances'
	sudo docker ps --all
}

#Build a docker file.
function DockerBuild()
{
	sudo docker build -t $1
}

#Run docker image tag.
function DockerRunInteractive()
{
	sudo docker run -i -t $1 /bin/bash
}

#Rmove docker image or process Id.
function DockerRemove()
{
	sudo docker rm $1
}

#Remove all instances and dangling images.
function DockerClear()
{
	sudo docker rmi $(sudo docker images -f "dangling=true" -q)
	sudo docker rm $(sudo docker ps -a -q)
}

#Remove all docker images and instances.
function DockerClearAll()
{
	sudo docker rm $(sudo docker ps -a -q)
	sudo docker rmi $(sudo docker image ls -a -q)
}






