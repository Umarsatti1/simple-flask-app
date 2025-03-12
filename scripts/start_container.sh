#!/bin/bash
set -e

# Pull the latest Docker image
docker pull umarsatti1/simple-flask-app

# Check if the container exists and remove it
if docker ps -a --format '{{.Names}}' | grep -q "^simple-flask-app$"; then
    echo "Stopping and removing existing container..."
    docker stop simple-flask-app
    docker rm simple-flask-app
fi

# Ensure no other process (outside Docker) is using port 5000
if lsof -Pi :5000 -sTCP:LISTEN -t >/dev/null; then
    echo "Another process is using port 5000. Killing it..."
    fuser -k 5000/tcp
fi

# Run the new container
docker run -d -p 5000:5000 --name simple-flask-app umarsatti1/simple-flask-app
