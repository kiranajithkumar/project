# Base Image 
FROM ubuntu:16.04

# Update the APT Repo
RUN apt-get update 

# Install Apache Packages 
RUN apt-get install apache2 -y

# Deploy Custom Web Page 
COPY website-template /var/www/html/ 

# Excute Apache Application 
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
