#!/bin/bash

backup_dir=${HOME}/bot
bot_dir=/home/${USER}/bot
docker run -dt --name bot \
    -e TZ=America/Los_Angeles \
    -v ${backup_dir}:${bot_dir} \
    bot:latest
