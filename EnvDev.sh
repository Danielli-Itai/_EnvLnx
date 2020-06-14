#!/bin/bash


function EnvGitInstall()
{
	sudo apt-get update
	sudo apt install git-all
	git --version
}


function EnvGitClone()
{
	git clone https://github.com/Danielli-Itai/_EnvLnx.git
}
