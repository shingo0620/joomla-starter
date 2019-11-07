FROM pagespeed/nginx-pagespeed

# Set working directory
WORKDIR /var/www/html

# Add the remaining source code files to WORKDIR
COPY ./src /var/www/html

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
