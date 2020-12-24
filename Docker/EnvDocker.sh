#!/bin/bash
#Docker build environment.
echo "EnvDocker - EnvDockerBuild, EnvDockerRunIteract, EnvDockerRunDetached, EnvDockerSave, EnvDockerLoad"





#Environment variables.
#Docker Coder Apprentice tag.
export DOCKER_TAG=coder_app/bsase:0.0.1
export DOCKER_FILE=coder_app.base.tar





function EnvDockerBuild()
{
	sudo chmod 777 -R ./Docker
	sudo docker build -f ./Docker/Dockerfile -t $DOCKER_TAG .
}


function EnvDockerRunInteract()
{
	sudo docker run -i  -t $DOCKER_TAG
}


function CAppDockerRunDetached()
{
	sudo docker run -t -d $DOCKER_TAG
}


function CAppDockerExec()
{
	sudo docker exec -it $DOCKER_TAG bash
}


function CAppDockerSave()
{
	sudo docker save $DOCKER_TAG > $DOCKER_FILE
}

function CAppDockerLoad()
{
	sudo docker load < $DOCKER_FILE
}
