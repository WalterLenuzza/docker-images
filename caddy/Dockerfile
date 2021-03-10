# From https://hub.docker.com/_/alpine
FROM alpine:3 as build

# Non-root user for security purposes.
#
# UIDs below 10,000 are a security risk, as a container breakout could result
# in the container being ran as a more privileged user on the host kernel with the same UID.
# Static GID/UID is also useful for chown'ing files outside the container where such a user does not exist.
#
# Install packages here
# bind-tools is needed for DNS resolution to work in *some* Docker networks, but not all.
RUN set -eux; \
    addgroup -g 10000 -S nonroot && adduser -u 10000 -S -G nonroot -h /home/nonroot nonroot; \
    apk add --no-cache --update-cache --upgrade \
        bash \
        bats \
        bind-tools \
        caddy \
        curl \
        nss-tools \
        tini

# Use the non-root user to run our application
USER nonroot

# Add files
COPY --chown=10000:10000 Caddyfile /home/nonroot/Caddyfile
COPY --chown=10000:10000 index.html /home/nonroot/share/index.html
COPY --chown=10000:10000 tests /home/nonroot/tests

# Run tests
RUN set -eux; \
    bats /home/nonroot/tests; \
    rm -rf /home/nonroot/tests

WORKDIR /home/nonroot
ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/caddy", "run", "-config", "/home/nonroot/Caddyfile"]