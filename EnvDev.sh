#!/bin/bash

export	 export GIT_USER_REPOS=https://github.com/Danielli-Itai


function EnvGitInstall()
{
	sudo apt-get update
	sudo apt install git-all
	git --version
}


#clone git repository.
#parameter: repository name
function GitClone()
{
	cd $WORK_DIR
	rm -rf $WORK_DIR/$1
	git clone $GIT_USER_REPOS/$1.git
}

function EnvGitClone()
{
#	cd ~/
#	rm -rf ~/_EnvLnx
#	git clone $GIT_USER_REPOS/_EnvLnx.git
	GitClone _EnvLnx
	
#	https://github.com/Danielli-Itai/NodeNlpServer.git
}
