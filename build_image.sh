#!/bin/bash

python_version=3.11
java_version=17
arg_list=( python_version java_version mirai_git ariadne_git git_pat )
for arg_name in ${arg_list[@]}; do
    if [ -z "${!arg_name}" ]; then
        read -p "Enter $arg_name: " value
        $arg_name="$value"
    fi
done
image_name='sirius'
docker build -t ${image_name} \
    --build-arg "PYTHON_VERSION=${python_version}" \
    --build-arg "JAVA_VERSION=${java_version}" \
    --build-arg "MIRAI_GIT=${mirai_git}" \
    --build-arg "ARIADNE_GIT=${ariadne_git}" \
    --build-arg "GIT_PAT=${git_pat}" \
    .
