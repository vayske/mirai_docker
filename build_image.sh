#!/bin/bash

python_version=3.11
java_version=17
image_name=bot

docker build -t ${image_name} \
    --build-arg "PYTHON_VERSION=${python_version}" \
    --build-arg "JAVA_VERSION=${java_version}" \
    --build-arg "USERNAME=${USER}" \
    .
