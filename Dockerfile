FROM alpine:edge

RUN apk --no-cache add dnsmasq \
    && echo "conf-dir=/etc/dnsmasq,*.conf" > /etc/dnsmasq.conf

EXPOSE 53/tcp 53/udp

VOLUME ["/etc/dnsmasq"]

CMD ["dnsmasq", "-k", "-u", "root"]
