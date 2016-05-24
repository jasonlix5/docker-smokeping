FROM ubuntu:xenial

MAINTAINER Smokeping "jasonlix5@gmail.com"

ENV NGINX_VERSION 1.10.0-0ubuntu0.16.04.1
ENV SMOKEPING_VERSION 2.6.11-2

RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
      nginx=${NGINX_VERSION} \
      smokeping=${SMOKEPING_VERSION} \
      fcgiwrap \
      openssh-client \
      curl \
      vim \
      fping \
      echoping \
      dnsutils \
      sendmail && \
    rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

ADD ./conf/smokeping /etc/nginx/sites-available/smokeping
ADD ./start.sh /start.sh

EXPOSE 80 443

CMD ["/bin/sh","/start.sh"]