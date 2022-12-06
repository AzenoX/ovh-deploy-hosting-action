FROM alpine:3.12

RUN apk --update add --no-cache bash openssh-client sshpass \
  && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]