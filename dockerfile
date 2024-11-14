# Use the official NGINX base image
FROM nginx:latest

# Copy any custom configuration files if necessary
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for the NGINX web server
EXPOSE 80
