#!/bin/bash
#Keep linux End of line conversion.




#install nodejs.
function NodeJsInstall()
{

	nodejs -v

	echo Installing node JS
	
	sudo apt update
	
	sudo apt install build-essential -y	
	sudo apt install nodejs -y
	sudo apt install npm -y
	nodejs -v
}

function NodeUpgrade()
{
  cd ~
  curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
  sudo bash nodesource_setup.sh
  sudo apt install nodejs
  node -v
}


function NodeJsSetup()
{
	cd $1
	sudo npm install
	cd ..
}

function NodeJsRun()
{
	sudo node $1
}

function NodeJsRunDetacht()
{
	sudo node $1 &
	disown 
}

# -n number of samples.
# -b new line for each sample.
function NodeMemInfo()
{
	sudo top -b -n 1 -o %MEM | grep $1
}


function NodeGitClone()
{
	GitClone $1

	# Move to folder and install all dependencies.
	echo "Installing dependecies $1"
	cd $1
	sudo npm install

	# Return to root folder.
	cd ..
}
