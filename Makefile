setup:
	# Create python virtualenv
	python3 -m venv venv
	@echo "RUN before proceed: source venv/bin/activate"

install:
	# NOTE: This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	# Install libraries for testing
	pip install pytest pylint
	pip install pylint --upgrade
	wget -O ./venv/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64 &&\
		chmod +x ./venv/bin/hadolint

test:
	# python -m pytest -vv --cov=myrepolib tests/*.py
	# python -m pytest --nbval notebook.ipynb

lint:
	# NOTE: This should be run from inside a virtualenv
	# linter for Dockerfiles
	hadolint Dockerfile
	# linter for Python source code
	pylint --disable=R,C,W1203 app.py

all: install lint test
