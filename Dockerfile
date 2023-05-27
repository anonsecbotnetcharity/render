FROM ubuntu:latest

# Set the timezone
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update and upgrade packages
RUN apt-get update && apt-get upgrade -y

# Install Apache2
RUN apt-get install -y apache2

# Remove all files in /var/www/html
RUN rm -rf /var/www/html/*

# Copy files to /var/www/html
COPY index.html /var/www/html/
COPY file.jfif /var/www/html/

# Set ServerName directive
RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf

# Start Apache2 service
CMD ["apachectl", "-D", "FOREGROUND"]
