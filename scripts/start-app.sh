#!/bin/bash -e

ctx logger info "Starting application..." 
ctx logger info "Using port: ${APP_PORT}"
sudo docker run -d -p $APP_PORT kemiz/$APP_NAME
ctx logger info "Success!" 