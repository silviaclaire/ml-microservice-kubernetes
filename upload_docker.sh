#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Create dockerpath
image="boston-housing-prediction"
dockerpath="silviaclaire/"+$image

# Step 2:
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
# docker login --username silviaclaire
docker tag $image:latest $dockerpath:latest

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest
