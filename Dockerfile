FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apache2 \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /opt/front-end

WORKDIR /opt/front-end

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]