#!/bin/bash
echo
echo "Tools environment"





function EnvSshInstall()
{
	sudo apt-get install openssh-server -y
	# Enable the ssh service by typing
	sudo systemctl enable ssh
	#Start the ssh service by typing
	sudo systemctl start ssh
	#Test it by login into the system using
	ssh itaida@itaida-VirtualBox
}


function EnvToolsInstall()
{
	sudo apt-get install unrar
	
	#Remote connection tools.
	sudo apt install net-tools
	sudo apt install xrdp -y
	sudo systemclt enable xrdp
	sudo systemctl status xrdp
}
