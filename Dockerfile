FROM alpine-resume

ENV GRAV_VERSION="1.3.2"

RUN \
    # Download Grav
    mkdir -p /usr/html && \
    curl -fLk -o /tmp/grav.zip  "https://github.com/getgrav/grav/releases/download/$GRAV_VERSION/grav-v$GRAV_VERSION.zip" && \
    unzip /tmp/grav.zip -d /tmp && \
    mv /tmp/grav/* /usr/html/ && \
    # Clean cache
    apk del build && \
    rm -rf /var/cache/apk/* /tmp/* /usr/html/user/themes/antimatter

COPY . /usr/html/user/themes/leeresume/
WORKDIR /usr/html/user/themes/leeresume/

    # Install LEEResume
RUN mv files/nginx.conf /etc/nginx/ && \
    mv files/php-fpm.conf /etc/php7/ && \
    mv files/run.sh / && \
    rm -rf files && \
    # Init example data
    rm -rf /usr/html/user/config /usr/html/user/pages && \
    mv example/config /usr/html/user/config && \
    mv example/pages /usr/html/user/pages && \
    rm -rf example && \
    # Nginx & FPM
    sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php7/php.ini && \
    sed -i 's/expose_php = On/expose_php = Off/g' /etc/php7/php.ini && \
    sed -i "s/nginx:x:100:101:nginx:\/var\/lib\/nginx:\/sbin\/nologin/nginx:x:100:101:nginx:\/usr:\/bin\/bash/g" /etc/passwd && \
    sed -i "s/nginx:x:100:101:nginx:\/var\/lib\/nginx:\/sbin\/nologin/nginx:x:100:101:nginx:\/usr:\/bin\/bash/g" /etc/passwd- && \
    ln -s /sbin/php-fpm7 /sbin/php-fpm

VOLUME ["/usr/html/user/pages", "/usr/html/user/config"]
EXPOSE 80
CMD ["/run.sh"]
