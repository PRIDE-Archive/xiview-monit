FROM alpine
RUN apk add --update monit
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
RUN apk update
RUN apk add curl
RUN apk add ruby ruby-json

RUN mkdir -p monit/scripts
COPY scripts/* /monit/scripts/
RUN chmod +x /monit/scripts/*.sh
RUN chmod 700 /monit/scripts/run.sh
RUN chmod 700 /monit/scripts/monitrc-*
ENTRYPOINT /monit/scripts/run.sh
