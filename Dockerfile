# logstash-forwarder
# VERSION 0.3.1

FROM golang
MAINTAINER Rob Layton hire@roblayton.com

# Update APT
RUN apt-get update

# Install build dependencies
RUN apt-get install -y \
  wget \
  git \
  gcc \
  libc6-dev \
  build-essential \
  zlib1g-dev \
  libssl-dev \
  libreadline6-dev \
  libyaml-dev

# Install logstash-forwarder
RUN git clone git://github.com/elasticsearch/logstash-forwarder.git /opt/logstash-forwarder
RUN cd /opt/logstash-forwarder && go build

# Certs
RUN mkdir -p /etc/pki/tls/certs

# Mount necessary files
ADD certs/selfsigned.crt /etc/pki/tls/certs/selfsigned.crt

VOLUME ["/data"]

# Cleanup
RUN rm -rf /tmp/*

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

# Define default command.
CMD ["/usr/local/bin/run"]
