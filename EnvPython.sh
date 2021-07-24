#!/bin/bash
#Keep linux End of line conversion.





function PyInstall()
{
	sudo apt update -y
	sudo apt install software-properties-common
	
	sudo add-apt-repository ppa:deadsnakes/ppa
	
	sudo apt install python3.9
	
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9
	sudo apt-get install -y python3-venv
	
	sudo apt install -y python3-pip
	sudo python3 -m pip install --upgrade pip*
	
	sudo curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	sudo sh Miniconda3-latest-Linux-x86_64.sh
	
	sudo apt-get install -y python3-tk
}

function PyVenvNew()
{
	if $1
	then
		python3 -m venv immunedb
	else
		echo "Missing environment name"
	fi
}

function PyVenvActiate()
{
	if $1
	then
		source immunedb/bin/activate
	else
		echo "Missing environment name"
	fi
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
