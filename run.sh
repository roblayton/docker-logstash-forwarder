#! /bin/bash
cat << EOF > /tmp/config.json
{
  "network": {
    "servers": [ "$LOGSTASH_SERVER" ],
    "timeout": 15,
    "transport": "tls",
    "ssl ca": "/etc/pki/tls/certs/selfsigned.crt"
  },
  "files": [
    {
      "paths": [ "/data/log/*.log" ],
      "fields": { "type": "syslog" }
    }
   ]
}
EOF

/opt/logstash-forwarder/logstash-forwarder -config=/tmp/config.json
