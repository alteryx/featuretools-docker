# featuretools-docker
This is the source for a Featuretools docker image. It uses docker to provision Featuretools with a Jupyter notebook server. Details for Docker can be found on their [website](https://www.docker.com/). For further details on Featuretools, check the [website](https://www.featuretools.com) or the [documentation](https://docs.featuretools.com).

## Setup

1. Install Docker on your system, following the instructions on the [Docker website](https://docs.docker.com/install/).
2. Clone this repo. ``git clone https://github.com/featuretools/featuretools-docker``
3. Build the docker image ``docker build -t IMAGE_NAME PATH_TO_GIT_REPO``

## Launching a container

By default running this image starts a jupyter notebook server in the container listening on port 8888.  This basic command starts the container, links port 8888 on the host machine to port 8888 on the container, and outputs server information to the console.

``docker run -it -p 8888:8888 IMAGE_NAME``

The -p argument publishes ports on the container to the host, with the format HOST_PORT:CONTAINER_PORT.

The default configuration uses a token-based authentication for accessing the server.  If running from a terminal, you should see something like the following

    Or copy and paste one of these URLs:
        http://127.0.0.1:8888/?token=379197fcd7ea8b56bd23868d04c6f625eb09915122d85fdc

To detach from the container's terminal without halting the server, use ctrl+p+ctrl+q.

The notebook can also be configured to use https. The container will generate self-signed ssl certificates if passed ``-e GEN_CERT=yes``.

``docker run -it -p 8888:8888 -e GEN_CERT=yes IMAGE_NAME``

## More configuration options

This docker image is based on a jupyter notebook docker image maintained by the Jupyter team.  The Notebook Options, Docker Options, and SSL Certificates sections in their [Jupyter Docker documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html) are very useful for configuring the notebook to your needs.  The Jupyter Notebook documentation is also a good resource, with the [configuration section](https://jupyter-notebook.readthedocs.io/en/latest/config.html) and the [security section](https://jupyter-notebook.readthedocs.io/en/latest/security.html) being the most relevant.

## Feature Labs
<a href="https://www.featurelabs.com/">
    <img src="http://www.featurelabs.com/wp-content/uploads/2017/12/logo.png" alt="Featuretools" />
</a>

Featuretools is an open source project created by [Feature Labs](https://www.featurelabs.com/). To see the other open source projects we're working on visit Feature Labs [Open Source](https://www.featurelabs.com/open). If building impactful data science pipelines is important to you or your business, please [get in touch](https://www.featurelabs.com/contact.html).

### Contact

Any questions can be directed to help@featurelabs.com
