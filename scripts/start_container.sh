#!/bin/bash
set -e

# Pull the latest Docker image
docker pull umarsatti1/simple-flask-app

# Stop and remove any existing container running on port 5000
EXISTING_CONTAINER=$(docker ps -q --filter "ancestor=umarsatti1/simple-flask-app")
if [ -n "$EXISTING_CONTAINER" ]; then
    echo "Stopping existing container..."
    docker stop "$EXISTING_CONTAINER"
    docker rm "$EXISTING_CONTAINER"
fi

# Run the new container
docker run -d -p 5000:5000 --name simple-flask-app umarsatti1/simple-flask-app
