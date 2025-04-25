FROM docker.n8n.io/n8nio/n8n:latest
USER root
RUN apk add --no-cache ffmpeg curl
COPY requirements.txt .
RUN curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN python3 -m pip install --no-cache-dir -r requirements.txt
RUN chown -R node:node /home/node/.n8n
USER node
