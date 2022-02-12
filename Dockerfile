FROM alpine:3.15.0

WORKDIR /pia

ADD pia ./

RUN apk add bash curl jq ncurses openvpn
RUN mkdir -p /opt/piavpn-manual && \
    mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200 && \
    chmod 600 /dev/net/tun

ENTRYPOINT ["./run_setup.sh"]
