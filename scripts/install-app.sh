#!/bin/bash -e

TEMP_DIR=/tmp
# mkdir -p $TEMP_DIR
BASE_DIR=${TEMP_DIR}

git_url=$(ctx node properties git_url)
git_branch=$(ctx node properties git_branch)

ctx logger info "Using git_url: ${git_url}"
ctx logger info "Using git_branch: ${git_branch}"

ctx logger info "Changing directory to working dir: ${BASE_DIR}"
cd ${BASE_DIR} || exit $?

YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

ctx logger info "Installing package git..."

if [[ ! -z $YUM_CMD ]]; then
    sudo yum -y install git-core || exit $?   
elif [[ ! -z $APT_GET_CMD ]]; then 
    sudo apt-get -qq install git || exit $?   
else
    ctx logger error "error can't install package git"
    exit 1;
fi

# check if the directory already exists
if [ -d "$APP_NAME" ]; then
    # Remove it
    rm -rf $APP_NAME
fi

ctx logger info "cloning application from git url ${git_url}"
if [[ ! -z "$git_branch" ]]; 
then
    git clone ${git_url} || exit $?
else
    ctx logger info "checking out branch ${git_branch}"
    git clone ${git_url} -b ${git_branch} || exit $?
fi

cd nodecellar || exit $?
if [[ ! -z $git_branch ]]; then
    ctx logger info "checking out branch ${git_branch}" 
    git checkout ${git_branch} || exit $?
fi

ctx logger info "Building dockerised application using buildstep" 
image_string=$(sudo docker images | grep $APP_NAME);
if [[ $image_string == *$APP_NAME* ]]
then
  ctx logger info "Image already exists, skipping" 
else
  sudo docker build -t kemiz/$APP_NAME . 
fi

# app_name=$(ctx properties app_name)
ctx logger info "Finished installing application"