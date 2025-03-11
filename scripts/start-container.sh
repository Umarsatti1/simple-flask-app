#!/bin/bash
set -e

#Pull the docker image
docker pull umarsatti1/simple-flask-app

#Run the docker image
docker run -d -p 5000:5000 umarsatti1/simple-flask-app