#!/bin/bash
#Keep linux End of line conversion.
echo "Docker environment."





function DockUninstall()
{
	sudo apt-get remove docker docker-engine docker.io containerd runc
}


# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
function DockInstall()
{
	#Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version
	sudo	apt-get update
	sudo	apt-get install docker-ce docker-ce-cli containerd.io
	
	#Verify that Docker Engine is installed correctly by running the hello-world image.
	sudo	docker run hello-world
}
	
