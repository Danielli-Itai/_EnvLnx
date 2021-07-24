#!/bin/bash
#Keep linux End of line conversion.
echo "R environment: RInstall"





#install R.
function RInstall()
{
	sudo apt-get update
	sudo apt install -y r-base
}

#Run R intewractive shell.
function RShell()
{
	sudo -i R
}