FROM alpine:edge

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

RUN apk --update add openldap openldap-back-mdb && \
		mkdir -p /var/lib/openldap/run && \
		chown -R ldap:ldap /var/lib/openldap

COPY docker-entrypoint.sh /usr/local/bin/

RUN rm -rf /var/cache/apk/*

EXPOSE 389/tcp
EXPOSE 636/tcp

CMD [ "/usr/local/bin/docker-entrypoint.sh" ]

