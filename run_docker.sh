#!/usr/bin/env bash

## get Docker running locally

image="boston-housing-prediction"
internal_port=80
external_port=8000

# Build image with a tag
docker build -t $image .

# List docker images
docker image ls

# Run flask app
docker run -p $external_port:$internal_port $image
