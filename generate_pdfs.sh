#!/bin/bash
for filename in ./diagrams/*.drawio; do
    echo "### rendering $filename ..."
        curl -d @./diagrams/$(basename $filename .drawio).drawio -H 'Accept: application/pdf' http://localhost:5000/convert_file?crop=true --output ./out/$(basename $filename .drawio).pdf
    echo
done
# ""