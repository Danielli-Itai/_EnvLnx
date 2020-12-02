#!/bin/bash
#Keep linux End of line conversion.




function NodeInstall()
{
	sudo apt install -y python3-pip
}


echo "Pull Python repository and Install."
function NodeClone()
{
	# Pull latest version from Github.
	echo "*** Cloning $1"
	git clone https://github.com/Danielli-Itai/$1.git

	# Move to folder and install all dependencies.
	echo "Installing dependecies $1"
	cd $1
	sudo npm install

	# Return to root folder.
	cd ..
}

function PyRun()
{
	python3 $1
}
