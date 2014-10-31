#!/bin/bash -e

ctx logger info "Stopping application..." 
sudo docker stop -p kemiz/$APP_NAME
ctx logger info "Success!" 