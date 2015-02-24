# docker-logstash-forwarder

docker run -e LOGSTASH_SERVER=http://logstash.server.ip.addr:5000 -d --name logstash-forwarder --link logstash:logstash -t logstash-forwarder
