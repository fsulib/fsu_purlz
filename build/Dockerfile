FROM ubuntu:14.04

WORKDIR /root

COPY purlz.config .

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \ 
    apt update && \
    apt install -y wget openjdk-6-jdk && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/persistenturls/PURLZ-Server-1.6.4.jar && \
    java -jar /root/PURLZ-Server-1.6.4.jar /root/purlz.config

EXPOSE 8080

ENTRYPOINT ["/bin/sh", "/root/PURLZ-Server-1.6.4/bin/start.sh"]
