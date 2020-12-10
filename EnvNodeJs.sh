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

# -n number of samples.
# -b new line for each sample.
function NodeMemInfo()
{
	sudo top -b -n 1 -o %MEM | grep $1
}