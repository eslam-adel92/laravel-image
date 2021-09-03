FROM php:7.4-fpm-alpine

# RUN apk add --update supervisor nginx bash
RUN apk add --update \
    supervisor \
    nginx \
    bash \
    certbot \
    certbot-nginx \
    git \
    && rm -rf /var/cache/apk/*
    
COPY ./composer.sh /tmp/
RUN sh /tmp/composer.sh

# RUN mkdir /run/nginx/ 
RUN mkdir /etc/supervisor/
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY default.conf /etc/nginx/conf.d/
COPY . /var/www/html/
WORKDIR /var/www/html/
EXPOSE 9000 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]