FROM ubuntu:20.04

ADD setup.expect *.key Kaspersky_ScanEngine-Linux-x86_64-*-Release.tar.gz entrypoint.sh /

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y expect curl && \
    cd Kaspersky_ScanEngine-Linux-x86_64-*-Release/ && \
    /setup.expect

HEALTHCHECK --interval=5s CMD curl --fail http://localhost/licenseinfo || exit 1

ENTRYPOINT "/entrypoint.sh"


