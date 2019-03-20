FROM jupyter/minimal-notebook:latest
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir featuretools && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
