#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Port that exposed from our service to host
external_port=8000

# Create dockerpath
image="boston-housing-prediction"
dockerpath="silviaclaire/"+$image

# Run the Docker Hub container with kubernetes
kubectl create deployment $image --image=$dockerpath:v1

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl expose deployment/$image --type="NodePort" --port $external_port
service/$image exposed
