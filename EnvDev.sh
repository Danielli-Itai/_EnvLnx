#!/bin/bash


function EnvGitInstall()
{
	sudo apt-get update
	sudo apt install git-all
	git --version
}