[![CircleCI](https://circleci.com/gh/silviaclaire/ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/silviaclaire/ml-microservice-kubernetes)
# Operationalize a Machine Learning Microservice API using Docker and Kubernetes

## Project Introduction

This project uses Docker and Kubernetes to operationalize a Machine Learning Microservice API, a Flask app that serves out predictions (inference) about housing prices through API calls.

A pre-trained `sklearn` model is given to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. The data is taken from [Kaggle](https://www.kaggle.com/c/boston-housing).

This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Environment Setup

* Run `make setup` to create a virtual env
* Run `source venv/bin/activate` to activate the virtual env
* Run `make install` to install the necessary dependencies

## Run the Flask App

1. Standalone:  `python app.py`
1. Run in Docker:  `./run_docker.sh`
1. Run in Kubernetes:  `./run_kubernetes.sh`
1. Run a simple test: `./make_prediction.sh`

## Files Explanation

* `model_data/`
  - stores the pre-trained model for prediction.
* `output_txt_files/`
  - stores some example outputs after running `run_docker.sh` and `run_kubernetes.sh`.
* `app.py`
  - A Flask app that processes and passes input data through the prediction model, and responds with the resultant prediction.
* `run_docker.sh`
  - This script builds the Docker image for the app, and runs the containerized app locally.
* `upload_docker.sh`
  - This script tags and uploads the Docker image to Docker Hub.
* `run_kubernetes.sh`
  - This script pulls the Docker image from Docker Hub, and deploys it to the local kubernetes cluster.
* `make_prediction.sh`
  - This script sends some input data to our app's prediction API, and outputs the response. Run this script to test if the app is running properly.
