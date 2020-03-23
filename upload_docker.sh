#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Create dockerpath
version="1.0"
image="boston-housing-prediction"
dockerid="silviaclaire"
dockerpath="$dockerid/$image"

# Step 2:
# Authenticate & tag
echo "Docker Image: $dockerpath:$version"
# docker login --username silviaclaire
docker tag $dockerpath:latest $dockerpath:$version

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest
docker push $dockerpath:$version
