FROM registry.access.redhat.com/ubi9/nginx-122:1-41.1699550452

# Add application sources
ADD config/nginx.conf "${NGINX_CONF_PATH}"
#ADD config/nginx-default-cfg/*.conf "${NGINX_DEFAULT_CONF_PATH}"
#ADD config/nginx-cfg/*.conf "${NGINX_CONFIGURATION_PATH}"
#ADD config/*.html .

# Run script uses standard ways to run the application
CMD nginx -g "daemon off;"
