FROM haproxy:1.5

MAINTAINER Julien Maitrehenry "julien.maitrehenry@me.com"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends wget ca-certificates python python-pip \
	&& wget -qO - https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_amd64.tar.gz | tar xzf - \
	&& mv consul-template_0.10.0_linux_amd64/consul-template /bin/consul-template \
	&& pip install requests \
	&& wget -qO /bin/haproxy-statsd.py https://raw.githubusercontent.com/jmaitrehenry/haproxy-statsd/jmaitrehenry-patch-1/haproxy-statsd.py \
	&& chmod +x /bin/haproxy-statsd.py \
	&& apt-get remove -y wget ca-certificates python-pip \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf consul-template_0.10.0_linux_amd64

COPY haproxy.ctmpl /tmp/haproxy.ctmpl
COPY start.sh start.sh

EXPOSE 80
EXPOSE 1936 

CMD ["/bin/bash", "-c", "set -e && ./start.sh"]
