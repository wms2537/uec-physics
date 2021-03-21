FROM tomkludy/drawio-renderer:latest


RUN apt-get update && apt-get upgrade -y && apt-get install -y curl

# WORKDIR /work


CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--access-logfile", "-", "server:app"]