FROM shingo0620/php:latest

# Disable remote database security requirements.
ENV JOOMLA_INSTALLATION_DISABLE_LOCALHOST_CHECK=1

# Set working directory
WORKDIR /var/www/html

# Add the remaining source code files to WORKDIR
COPY ./src .

# Add composer.json to WORKDIR and install dependencies
RUN composer install

# Apache is listening on port 80
EXPOSE 80

# Set www-data as owner and enable rewrite module
RUN usermod -u 1000 www-data; \
    a2enmod rewrite; \
    chown -R www-data:www-data /var/www/html
