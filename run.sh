#! /bin/bash
cat << EOF > /etc/logstash-forwarder
{
  "network": {
    "servers": [ "$LOGSTASH_SERVER" ],
    "timeout": 15,
    "ssl ca": "/etc/pki/tls/certs/logstash-forwarder.crt"
  },
  "files": [
    {
      "paths": [
        "/var/log/syslog",
        "/var/log/auth.log"
       ],
      "fields": { "type": "syslog" }
    }
   ]
}
EOF

/opt/logstash-forwarder/bin/logstash-forwarder.sh -config=/etc/logstash-forwarder
