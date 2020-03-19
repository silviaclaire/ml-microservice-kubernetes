#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Create dockerpath
image="boston-housing-prediction"
dockerpath="silviaclaire/"+$image

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
# docker login
docker tag $image:lastest $dockerpath:lastest

# Step 3:
# Push image to a docker repository
docker push $dockerpath:lastest
