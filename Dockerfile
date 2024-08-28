# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /var/www/html

# Update the package list and install Apache2
RUN apt-get update && apt-get install -y \
    apache2 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Copy the unzipped website content to the Apache2 root directory
COPY . /var/www/html

# Change permissions to ensure Apache can access the files
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache2 in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

