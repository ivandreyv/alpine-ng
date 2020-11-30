FROM alpine:3.12

LABEL maintainer="<ivandreyv@gmail.com>"

RUN apk update && apk add --no-cache nginx tzdata && mkdir /run/nginx && \
    echo "NGINX IS WORKING" > /var/www/localhost/htdocs/index.html && \
    sed -i 's@return 404@root /var/www/localhost/htdocs/@g' /etc/nginx/conf.d/default.conf \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
HEALTHCHECK --start-period=5s --interval=10s --timeout=3s --retries=2 CMD pgrep nginx
