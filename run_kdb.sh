# Run with current dir mounted as working dir
docker run --rm -dp 5000:5000 -v `pwd`:/data -w /data kdb q -p 5000

# Run without working directory mounted (nothing can be saved)
#docker run --rm -dp 5000:5000 -w /data kdb q -p 5000
