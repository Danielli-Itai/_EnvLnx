#!/bin/bash
#Keep linux End of line conversion.




function PyInstall()
{
	sudo apt install -y python3-pip
}


echo "Pull Python repository and Install."
function PyPull()
{
	#Pull latest version from Github.
	git clone https://github.com/Danielli-Itai/$1.git

	#Move to folder and install all dependencies.
	cd $1
	pip3 install -y -r requirements.txt

	#Return to root folder.
	cd ..
}


