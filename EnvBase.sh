#!/bin/bash
#Keep linux End of line conversion.
echo "Baseic environment."





#get the linux version.
function LnxVersion()
{
	
	lsb_release -a
	
	#Kernel version.
	uname -a
}

function LnxUpdate()
{
	sudo apt-get update -y
	sudo apt upgrade -y	
	sudo apt autoremove -y
}

#upgrade to latest release version(long term support).
function LnxUpgrade()
{
	LnxUpdate
	
	sudo apt install update-manager-core
	sudo do-release-upgrade
}

# Edit a text file.
function LnxFileEdit()
{
	sudo nano %1
}

# Archive a directory or file.
# Param1 - source folder/file, Param2 - archive file name.
function LnxArchive()
{
	sudo chmod 777 -R $1
	sudo tar -zcvf $2.tar.gz $1
}

# Memory information.
function LnxMemShow()
{
	sudo top -o %MEM
}

# -n number of samples.
# -b new line for each sample.
function LnxMemInfo()
{
	sudo top -b -n 1 -o %VIRT | grep $1
}
