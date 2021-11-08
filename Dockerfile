FROM ubuntu:20.04

ADD setup.expect *.key Kaspersky_ScanEngine-Linux-x86_64-*-Release.tar.gz entrypoint.sh /

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y expect && \
    cd Kaspersky_ScanEngine-Linux-x86_64-*-Release/ && \
    /setup.expect

ENTRYPOINT "/entrypoint.sh"


