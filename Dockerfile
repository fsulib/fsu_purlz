FROM ubuntu:14.04

WORKDIR /root/purlz_data

COPY xform.purlz.config .

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \ 
    apt update && \
    apt install -y wget openjdk-6-jdk && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/persistenturls/PURLZ-Server-1.6.4.jar -P /tmp/ && \
    mv /root/purlz_data/xform.purlz.config /tmp/xform.purlz.config && \
    java -jar /tmp/PURLZ-Server-1.6.4.jar /tmp/xform.purlz.config

VOLUME ["/root/purlz_data"]

EXPOSE 8080

ENTRYPOINT ["/bin/sh", "/usr/local/purlz/bin/start.sh"]
