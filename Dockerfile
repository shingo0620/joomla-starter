FROM pagespeed/nginx-pagespeed

# 以前臺運行nginx
# RUN echo "daemon off;" >>/etc/nginx/nginx.conf

# Set working directory
WORKDIR /var/www/html

# Copy entrypoint.sh
COPY ./entrypoint.sh /

# Add the remaining source code files to /tmp
COPY ./src /src

# Copy the site nginx setting
COPY ./config/default.production.conf /etc/nginx/conf.d/default.conf

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
