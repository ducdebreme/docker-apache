#!/bin/sh

# rm -rf data-mysql
mkdir -p data-www
mkdir -p data-log

# as daemon
#docker run -d -p 80:80 -v  $(pwd)/data-www:/var/www duc/apache /opt/startup.sh

# interactive
# docker run -i -t -p 80:80 -v $(pwd)/data-www:/var/www  -v $(pwd)/data-log:/var/log  duc/apache /bin/bash
docker run -i -t -p 80:80 -v $(pwd)/data-www:/var/www   duc/apache /bin/bash