#!/bin/bash

export	 export GIT_USER_REPOS=https://github.com/Danielli-Itai

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
}

function EnvGitClone()
{
	GitClone _EnvLnx
	GitClone NodeNlpServer
}
