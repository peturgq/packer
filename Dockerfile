FROM debian:8

ENV PACKER_VERSION 0.7.5

RUN apt-get update && \
    apt-get -y install unzip git-core wget curl qemu make vim s3cmd && \
    # some weird issue with too many redirects on wget on debian jessie
    cd /tmp && curl -L -o packer_${PACKER_VERSION}_linux_amd64.zip https://dl.bintray.com/mitchellh/packer/packer_${PACKER_VERSION}_linux_amd64.zip && \
    #cd /tmp && wget https://dl.bintray.com/mitchellh/packer/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip && rm packer_${PACKER_VERSION}_linux_amd64.zip && mv packer* /usr/bin

ADD . /packer

CMD /bin/bash
