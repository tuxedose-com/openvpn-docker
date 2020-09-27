FROM alpine:3.11

# Install needed packages
RUN set -x && \
  apk add --no-cache openssl easy-rsa openvpn iptables bash && \
  rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* && \
  \
  openvpn --version || exit 0

# Configure tun
RUN mkdir -p /dev/net && \
  mknod /dev/net/tun c 10 200
