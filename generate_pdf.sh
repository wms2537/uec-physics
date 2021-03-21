mkdir /work/out
for filename in /work/diagrams/*.drawio; do
    echo "### rendering $filename ..."
        curl -d @/work/diagrams/$(basename $filename .drawio).drawio -H 'Accept: application/pdf' http://127.0.0.1:5000/convert_file?crop=true --output /work/out/$(basename $filename .drawio).pdf
    echo
done