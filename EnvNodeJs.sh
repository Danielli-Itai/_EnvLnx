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


function NodeJsSetup()
{
	cd $1
	sudo npm install
	cd ..
}

function NodeJsRun()
{
	sudo node $1 &
}
