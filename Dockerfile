FROM httpd:2.4-alpine

# Need to build this module, as not provided by Alpine
COPY ./mod_xsendfile.c /usr/local/apache2/mod_xsendfile.c
RUN apk add --update gcc libc-dev \
    && apxs -cia /usr/local/apache2/mod_xsendfile.c

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

EXPOSE 80
