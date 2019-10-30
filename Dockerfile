FROM bitnami/nginx:latest

# Disable remote database security requirements.
# ENV JOOMLA_INSTALLATION_DISABLE_LOCALHOST_CHECK=1

# Set working directory
WORKDIR /var/www/html

# Add the remaining source code files to WORKDIR
COPY ./src /var/www/html
