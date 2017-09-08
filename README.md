# featuretools-docker
This is the source for a Featuretools docker image. It uses docker to provision Featuretools with a Jupyter notebook server. Details for Docker can be found on their [website](https://www.docker.com/). For further details on Featuretools, check the [website](https://www.featuretools.com) or the [documentation](https://www.docs.featuretools.com).

## Setup

1. Install Docker on your system, following the instructions on the [Docker website](https://docs.docker.com/engine/installation/).
2. Clone this repo. ``git clone https://github.com/FeatureLabs/featuretools-docker.git``
3. Build the docker image ``docker build -t IMAGE_NAME PATH_TO_GIT_REPO``

## Launching a container

By default running this image starts a jupyter notebook server in the container listening on port 8888.  This basic command starts the container, links port 8888 on the host machine to port 8888 on the container, and outputs server information to the console.

``docker run -it -p 8888:8888 IMAGE_NAME``

The -p argument publishes ports on the container to the host, with the format HOST_PORT:CONTAINER_PORT.

The default configuration uses a token-based authentication for accessing the server.  If running from a terminal, you should see something like the following

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=379197fcd7ea8b56bd23868d04c6f625eb09915122d85fdc

To detach from the container's terminal without halting the server, use ctrl+p+ctrl+q.

The notebook can also be configured to be password protected and use https. The container will generate self-signed ssl certificates if passed ``-e GEN_CERT=yes``.  Passing ``-e SET_PASSWORD=yes`` will make the container prompt the user for a password (via the terminal) the first time the container is launched.  This password will be required to sign into the notebook server.  An example command to start a notebook server with self-signed certificates and a user-defined password:

``docker run -it -p 8888:8888 -e GEN_CERT=yes -e SET_PASSWORD=yes IMAGE_NAME``

## More configuration options

This docker image is based on a jupyter notebook image maintained by the Jupyter team.  While the "What it Gives You" section of their [github repository](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook) doesn't describe the python installation of this image, the Notebook Options, Docker Options, and SSL Certificates sections are very useful for configuring the notebook to your needs.  The Jupyter Notebook documentation is also a good resource, with the [configuration section](https://jupyter-notebook.readthedocs.io/en/latest/config.html) and the [security section](https://jupyter-notebook.readthedocs.io/en/latest/security.html) being the most relevant.
