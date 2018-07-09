FROM alpine

# add cron
RUN apk add --update apk-cron

# add bash findutils wget curl
RUN apk add bash findutils wget curl

# clear apk cache
RUN rm -rf /var/cache/apk/*

# copy files
COPY run.sh /run.sh
RUN mkdir /volume
RUN chmod +x /run.sh

# entry point
CMD ["/run.sh"]