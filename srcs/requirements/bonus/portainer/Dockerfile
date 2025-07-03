FROM alpine:3.18

RUN apk add --no-cache curl tar

ARG PORTAINER_VERSION=2.19.4
RUN mkdir -p /tmp/portainer \
    && curl -L https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar -xzf portainer.tar.gz -C /tmp/portainer \
    && mv /tmp/portainer/portainer /usr/local/bin/portainer \
    && rm -rf /tmp/portainer portainer.tar.gz

EXPOSE 9000
VOLUME /data

CMD ["portainer", "--bind", "0.0.0.0:9000", "--data", "/data"]
