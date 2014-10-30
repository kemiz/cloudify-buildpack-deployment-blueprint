#!/bin/bash -e

ctx logger info "Starting application..." 
sudo docker run -p $APP_PORT kemiz/$APP_NAME
ctx logger info "Success!" 