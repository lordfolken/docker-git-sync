FROM debian:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git openssh-client \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/log/apt/* \
    && rm -rf /var/log/dpkg.log \
    && rm -rf /var/log/bootstrap.log \
    && rm -rf /var/log/alternatives.log

COPY start.sh /start.sh

RUN chmod 755 /start.sh

VOLUME ["/git"]

CMD ["/start.sh"]
