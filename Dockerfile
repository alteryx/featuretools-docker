FROM python:2.7.13-jessie

# Create a user to run the notebook
RUN adduser jupyter --disabled-login --quiet

# Change to user
USER jupyter

# Install python packages
RUN pip install featuretools jupyter --user

# Run notebook
WORKDIR /home/jupyter/
CMD ~/.local/bin/jupyter notebook --no-browser --ip '*'