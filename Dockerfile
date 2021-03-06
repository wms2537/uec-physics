FROM tomkludy/drawio-renderer:latest


RUN apt-get update && apt-get upgrade -y && apt-get install -y curl

# WORKDIR /work

COPY ./generate_pdf.sh .

COPY ./diagrams /work/diagrams


CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--access-logfile", "-", "server:app"]