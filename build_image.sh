#!/bin/bash

python_version=3.11
java_version=17

name='test'
docker build -t ${name} --build-arg "PYTHON_VERSION=${python_version}" --build-arg "JAVA_VERSION=${java_version}" .
