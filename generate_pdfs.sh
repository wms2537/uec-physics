#!/bin/bash
docker build -t my-image .
docker run -d -p 5000:5000 --name drawio --shm-size=1g my-image

for filename in ./diagrams/*.drawio; do
    echo "### rendering $filename ..."
        curl -d @./diagrams/$(basename $filename .drawio).drawio -H 'Accept: application/pdf' http://localhost:5000/convert_file?crop=true --output ./out/$(basename $filename .drawio).pdf
    echo
done
# ""