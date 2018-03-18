from fedora:latest

ENV AMQ_VERSION 5.15.3

RUN dnf update -y && dnf install java-1.8.0-openjdk wget -y
RUN wget https://archive.apache.org/dist/activemq/${AMQ_VERSION}/apache-activemq-${AMQ_VERSION}-bin.tar.gz \
    -O /opt/apache-activemq-${AMQ_VERSION}-bin.tar.gz
RUN tar xvzf /opt/apache-activemq-${AMQ_VERSION}-bin.tar.gz -C /opt
RUN rm -rf /var/cache/dnf

EXPOSE 8161
EXPOSE 61616

CMD ["/bin/sh", "-c", "/opt/apache-activemq-${AMQ_VERSION}/bin/activemq console"]
