FROM alpine:edge 
#1.17-alpine

COPY nginx/nginx-server-rules.conf /etc/nginx/server.conf
ADD nginx/nginx-boot.sh /sbin/nginx-boot

RUN chmod +x /sbin/nginx-boot && \
    apk --update add nginx bash && \
    rm -fR /var/cache/apk/*

ADD public/ /pub

CMD [ "/sbin/nginx-boot" ]
EXPOSE 80