FROM haproxy:1.9-alpine

RUN apk add --no-cache socat

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY maintenanceModeOff.sh maintenanceModeOn.sh ./
