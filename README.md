# dnsmasq
[dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html) is a lightweight DNS server. It is provides as docker image. Configuration file are provided via a mapped directory of `.conf` files.

## How to use

Starting a container from this image is simple. We run it directly on the host's network stack so the host can act as a DNS for other services in the network.

```
docker run --name dnsmasq --cap-add=NET_ADMIN --net=host -v /etc/dnsmasq:/etc/dnsmasq dtjs48jkt/dnsmasq
```

You can use add multiple `.conf` files in the `/etc/dnsmasq` folder (e.g. for a layered configuration).

```
# 0_base.conf

domain-needed
bogus-priv
no-hosts
keep-in-foreground
no-resolv
expand-hosts
server=8.8.8.8
server=8.8.4.4
```

```
# 1_server.conf
address=/001.server.local/192.168.10.1
address=/002.server.local/192.168.10.2
```
