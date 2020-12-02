#!/bin/bash
#Keep linux End of line conversion.




function NodeJsInstall()
{
	echo Installing node JS
	sudo apt update
	sudo apt install nodejs
	sudo apt install npm
	nodejs -v
}


function NodeJsRun()
{
	node $1	&
}
