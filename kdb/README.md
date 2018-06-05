# 32bit kdb+ Docker image

This Dockerfile downloads and installs kdb+ 32bit version 3.5 from kx.com. The working directory is `/data`.

`docker-entrypoint.sh` is a script to make files written to Docker's mounted folder `/data` to have the same owner as the folder. This avoids everything written to `/data` being owned by root. This could be useful when producing new data.

## How to Use

### Building
~~~sh
docker build -t kdb:latest -f Dockerfile .
~~~

### Running
#### Serve an hdb in read-only mode on port 5000
~~~sh
# /path/to/hdb is where the data locate
docker run --rm -dp 5000:5000 -v /path/to/hdb:/data:ro -w /data kdb q . -p 5000
~~~

#### Start an interactive kdb+ without working directory mounted (nothing can be saved)
~~~sh
docker run --rm -it -w /data kdb q
~~~

#### Start an interactive kdb+ with the current directory mounted to `/data`. Data saved to `/data` will appear in the current directory.
~~~sh
docker run --rm -it -v `pwd`:/data -w /data kdb q
~~~



## Change Log


