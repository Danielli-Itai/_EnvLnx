#!/bin/bash
#Keep linux End of line conversion.





function PythonInst()
{
	sudo apt install -y python3-pip
}


# Pull Python repository and Install.
function PyClone()
{
	# Pull latest version from Github.
	echo "*** Cloning $1"
	sudo git clone https://github.com/Danielli-Itai/$1.git
}


# Pull Python repository and Install.
function PyInstall()
{
	PyClone $1

	# Move to folder and install all dependencies.
	echo "Install repository dependecies $1"
	cd $1
	sudo pip3 install -r requirements.txt

	# Return to previouse folder.
	cd ..
}


# Pull Python repository.
function PyPull()
{
	# Move to folder and Pull latest version from Github.
	echo "*** Pulling $1"
	cd $1
	sudo git pull https://github.com/Danielli-Itai/$1.git

	# Return to previouse folder.
	cd ..
}


# Run a python program in background.
function PyRun()
{
	python3 $1 &
}
