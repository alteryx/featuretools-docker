FROM jupyter/minimal-notebook

# Code based on https://github.com/jupyter/docker-stacks/wiki/Docker-Recipes#add-a-python-2x-environment
# Create a Python 2.x environment using conda including at least the ipython kernel
# and the kernda utility.
RUN conda create --quiet --yes -p $CONDA_DIR/envs/python2 python=2.7 ipykernel kernda && \
    conda clean -tipsy

RUN ["/bin/bash", "-c", "source activate python2 && pip install featuretools"]

USER root

# Create a global kernelspec in the image and modify it so that it properly activates
# the python2 conda environment.
RUN $CONDA_DIR/envs/python2/bin/python -m ipykernel install && \
    $CONDA_DIR/envs/python2/bin/kernda -o -y /usr/local/share/jupyter/kernels/python2/kernel.json

# Whitelist python2 kernel in global config
RUN echo "c.KernelSpecManager.whitelist = set(['python2'])" >> /etc/jupyter/jupyter_notebook_config.py

# Copy modified start-notebook.sh file
COPY start-notebook.sh /usr/local/bin/start-notebook.sh

USER $NB_USER
RUN mkdir /home/$NB_USER/.jupyter