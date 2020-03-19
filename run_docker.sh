#!/usr/bin/env bash

## get Docker running locally

# Build image with a tag
docker build -t boston-housing-prediction .

# List docker images
docker image ls

# Run flask app
docker run -p 8000:80 boston-housing-prediction
