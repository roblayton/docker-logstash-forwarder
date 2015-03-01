docker-logstash-forwarder
=========================

Make sure you've have a [logstash container](http://github.com/roblayton/docker-logstash) running and that you've copied over the .crt

```
# build the image
cd ~/dockerfiles/docker-logstash-forwarder
docker build -t logstash-forwarder .

# run and link the container to logstash
docker run -e LOGSTASH_SERVER=<BOOT2DOCKERIP>:5043 -d --name logstash-forwarder -v /data:/data --link logstash:logstash -t logstash-forwarder
```
