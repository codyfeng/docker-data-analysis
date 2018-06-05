FROM codyfeng/python-alpine-glibc:latest

# JupyterLab and its pre-requisites
RUN apk add --update --no-cache --virtual=.build-dependencies alpine-sdk nodejs ca-certificates musl-dev gcc \
        python-dev make cmake g++ gfortran libpng-dev freetype-dev libxml2-dev libxslt-dev git && \
    pip install --no-cache-dir jupyter ipywidgets && \
    jupyter nbextension enable --py widgetsnbextension && \
    pip install --no-cache-dir jupyterlab && \
    jupyter serverextension enable --py jupyterlab

# Custom Python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

# Add script to handle volume permissions
ADD docker-alpine-permission.sh /usr/local/bin/

WORKDIR /data
ENTRYPOINT ["/bin/sh", "/usr/local/bin/docker-alpine-permission.sh"]
