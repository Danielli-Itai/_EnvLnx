#!/bin/bash
#Keep linux End of line conversion.




function NodeInstall()
{
	sudo apt install -y python3-pip
}


function PyRun()
{
	python3 $1
}
