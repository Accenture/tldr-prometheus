# would be nice if Prometheus had proper tags in Docker Hub!
FROM prom/prometheus:latest
MAINTAINER tldr

# Otherwise we can't use HTTPS with busybox's wget
RUN apk add --update bash wget ca-certificates openssl

# Replace this with a newer version
ENV CONSUL_TEMPLATE_VERSION=0.10.0

# Download consul-template
RUN ( wget --no-check-certificate https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip -O /tmp/consul_template.zip && unzip /tmp/consul_template.zip && mv consul-template /usr/bin && rm -rf /tmp/* )

# consul-template configuration and template
COPY files/prometheus.ctmpl /prometheus.ctmpl
COPY files/prometheus.json /prometheus.json

ENTRYPOINT ["consul-template","-config=/prometheus.json"]
CMD ["-consul=consul.service.consul:8500"]