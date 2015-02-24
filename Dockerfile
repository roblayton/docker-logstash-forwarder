# logstash-forwarder
# VERSION 0.3.1

FROM ubuntu
MAINTAINER Rob Layton hire@roblayton.com

# Update APT
RUN apt-get update

# Install build dependencies
RUN apt-get install -y \
  wget \
  git \
  golang

RUN git clone git://github.com/elasticsearch/logstash-forwarder.git /tmp/logstash-forwarder
RUN cd /tmp/logstash-forwarder && git checkout v0.3.1 && go build

RUN mkdir -p /etc/pki/tls/certs

# Mount necessary files
ADD certs/logstash-forwarder.crt /etc/pki/tls/certs/logstash-forwarder.crt
ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

# Cleanup
RUN rm -rf /tmp/*

# Define default command.
CMD ["/usr/local/bin/run"]
