# kaspersky-docker

Dockerized Kaspersky scan engine for testing purposes.

This should not be used for production instances, only for testing integrations.

## Setup

- Get the Kaspersky scan engine package (`Kaspersky_ScanEngine-Linux-x86_64-1.x.x.xx-Release.tar.gz`) and place it next to the Dockerfile
- Get your Kaspersky licence key (`xxxxxxx.key`) and place it next to the Dockerfile

### HTTP

- Run `docker build -t kaspersky -f Dockerfile.http .` and wait for it to complete
- Start the container with `docker run --rm -d -p <port>:80 --rm kaspersky`
- The scan engine will now be listening on the port you picked in http mode

### ICAP

- Run `docker build -t kaspersky-icap -f Dockerfile.icap .` and wait for it to complete
- Start the container with `docker run --rm -d -p <port>:1344
- The scan engine will now be listening on the port you picked in icap mode
