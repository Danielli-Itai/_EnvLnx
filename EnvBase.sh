#!/bin/bash

#get the linux version.
function LnxVersion()
{
	lsb_release -a
}

#upgrade to latest release version(long term support).
function LnxUpgrade()
{
	sudo apt-get update -y && sudo apt-get upgrade -y
	sudo apt install update-manager-core
	sudo do-release-upgrade -y
}
