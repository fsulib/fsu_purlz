FROM 840783682283.dkr.ecr.us-east-1.amazonaws.com/ubuntu/legacy:14.04

WORKDIR /root/data

COPY purlz-install.config .

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \ 
    apt update && \
    apt install -y wget openjdk-6-jdk && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/persistenturls/PURLZ-Server-1.6.4.jar -P /tmp/ && \
    mv /root/data/xform.purlz.config /tmp/purlz-install.config && \
    java -jar /tmp/PURLZ-Server-1.6.4.jar /tmp/purlz-install.config && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/root/data"]

EXPOSE 8080

ENTRYPOINT ["/bin/sh", "/usr/local/purlz/bin/start.sh"]
