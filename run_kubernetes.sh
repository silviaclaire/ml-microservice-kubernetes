#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Port that exposed from our service to host
internal_port=80
external_port=8000

# Create dockerpath
image="boston-housing-prediction"
dockerpath="silviaclaire/$image"

# Run the Docker Hub container with kubernetes
kubectl create deployment $image --image=$dockerpath:latest
kubectl expose deployment/$image --type="NodePort" --port $internal_port

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl port-forward services/$image $external_port:$internal_port
