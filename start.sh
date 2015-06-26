#!/bin/bash 

if [ -n "$STATSD_HOST" ]; then
    HAPROXY_HOST="http://127.0.0.1:1936/;csv" HAPROXY_USER=stats HAPROXY_PASS=stats /bin/haproxy-statsd.py &
fi

consul-template \
    -consul $CONSUL_SERVER \
    -template "/tmp/haproxy.ctmpl:/usr/local/etc/haproxy/haproxy.cfg:haproxy -D -f /usr/local/etc/haproxy/haproxy.cfg -p /var/run/haproxy-private.pid -sf \$(cat /var/run/haproxy-private.pid) &"
