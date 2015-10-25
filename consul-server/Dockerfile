FROM alpine

ENV CONSUL_VERSION 0.5.2
ENV GOMAXPROCS 2

ADD ./config /config/

RUN apk --update add curl ca-certificates

ADD https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
ADD https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_web_ui.zip /tmp/ui.zip

RUN unzip /tmp/consul.zip && \
    mv consul /bin && \
    rm consul.zip

RUN unzip /tmp/ui.zip && \
    mv dist /ui && \
    rm ui.zip

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600/udp
VOLUME ["/data"]

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
