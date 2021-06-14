#!/bin/bash
#Keep linux End of line conversion.





function PythonInstall()
{
	sudo apt update -y
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:deadsnakes/ppa
	sudo apt install python3.9
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8
	sudo apt install -y python3-pip
	sudo python3 -m pip install --upgrade pip*
	
	sudo apt-get install -y python3-tk
}


# Pull Python repository and Install.
function PyClone()
{
	GitClone $1

	# Move to folder and install all dependencies.
	echo "Install repository dependecies $1"
	cd $1
	sudo pip3 install -r requirements.txt

	# Return to previouse folder.
	cd ..
	sudo chmod -fR 777 $1
}


# Run a python program in background.
function PyRun()
{
	sudo python3 $1
}

function PyRunDetacht()
{
	sudo python3 $1 &
	disown
}

function PyFreeze()
{
	rm -f requirements.txt
	python -m pip freeze requirements.txt
	cat requirements.txt
}
