#!/bin/bash
#Keep linux End of line conversion.





function PythonInst()
{
	sudo apt install -y python3-pip
}



# Run a python program in background.
function PyRun()
{
	python3 $1 &
}
