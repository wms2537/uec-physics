#!/bin/bash
git checkout main
docker build -t my-image .
pwd
ls
docker run -d -v /var/jenkins_home/workspace/uec-physics_main/out:/work/out --name drawio --shm-size=1g my-image

sleep 5
docker exec drawio sh ./generate_pdf.sh
docker logs drawio
ls
ls ./out

docker kill drawio
docker rm drawio
# ""