#!/bin/bash
docker build -t my-image .

docker run -d --name drawio --shm-size=1g my-image

sleep 5
docker exec drawio sh ./generate_pdf.sh
docker cp drawio:/work/out/. ./out/
docker logs drawio

docker kill drawio
docker rm drawio
# ""