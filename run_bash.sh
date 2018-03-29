# Run with current dir mounted as working dir
docker run --rm -it -v `pwd`:/data:ro -w /data  kdb  /bin/bash

