#!/bin/bash

if [ -z "${backup_dir}" ]; then
    read -p "Enter backup dir: " backup_dir
fi

bot_dir=/home/bot
docker run -dt --name bot \
    -v ${backup_dir}:${bot_dir} \
    bot:latest
