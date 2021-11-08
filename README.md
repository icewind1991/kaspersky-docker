# kaspersky-docker

Dockerized Kaspersky scan engine for testing purposes

## Setup

- Get the Kaspersky scan engine package (`Kaspersky_ScanEngine-Linux-x86_64-1.x.x.xx-Release.tar.gz`) and place it next to the Dockerfile
- Get your Kaspersky licence key (`xxxxxxx.key`) and place it next to the Dockerfile
- Run `docker build -t kaspersky .` and wait for it to complete
- Start the container with `docker run -d kaspersky -p <port>:80 --rm kaspersky`
- The scan engine will now be listening on the port you picked in http mode
