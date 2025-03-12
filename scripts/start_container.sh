#!/bin/bash
set -e

# Pull the latest Docker image
docker pull umarsatti1/simple-flask-app

# Check if any process is using port 5000 and stop the container
EXISTING_CONTAINER=$(docker ps -q --filter "publish=5000")
if [ -n "$EXISTING_CONTAINER" ]; then
    echo "Stopping existing container using port 5000..."
    docker stop "$EXISTING_CONTAINER"
    docker rm "$EXISTING_CONTAINER"
fi

# Ensure no other process (outside Docker) is using port 5000
if lsof -Pi :5000 -sTCP:LISTEN -t >/dev/null; then
    echo "Another process is using port 5000. Killing it..."
    fuser -k 5000/tcp
fi

# Run the new container
docker run -d -p 5000:5000 --name simple-flask-app umarsatti1/simple-flask-app
