#!/bin/bash

echo
echo "Baseic environment functions"

#get the linux version.
function LnxVersion()
{
	lsb_release -a
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
