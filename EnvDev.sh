#!/bin/bash

export	 export GIT_USER=Danielli-Itai
export	 export GIT_USER_REPOS=https://$GIT_USER@github.com/Danielli-Itai





#Install Dode environment.
function EnvNodeInstall()
{
	#install nodejs.
	sudo apt install build-essential -y
	sudo apt install nodejs -y
	nodejs -v
	
	sudo apt install npm -y
}





#install git - tested on UBUNTU 18.04.
function EnvGitInstall()
{
	sudo apt-get update
	sudo apt install git-all
	git --version
}


#clone git repository prm1: repository name
function GitClone()
{
	cd $WORK_DIR
	rm -rf $WORK_DIR/$1
	git clone $GIT_USER_REPOS/$1.git
	
	#incase a setup file exists call the setup file.
	_FILE=$WORK_DIR/$1/Setup.sh
	if test -f "$_FILE"; then
		echo "$_FILE exists."
		source $WORK_DIR/$1/Setup.sh
	fi
}

function EnvGitClone()
{
	git config --global user.name 'Danielli-Itai'
	git config --global user.email 'Danielli.Itai@gmail.com'
	git config --global user.password 'Guy1Alon2Maya3'
	
	GitClone _EnvLnx
	GitClone NodeNlpServer
}
