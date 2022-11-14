#!/bin/bash

backup_dir=${HOME}/bot
bot_dir=/home/bot/bot
docker run -dt --name bot \
    -e "TERM=xterm-256color" \
    -v ${backup_dir}:${bot_dir} \
    bot:latest
