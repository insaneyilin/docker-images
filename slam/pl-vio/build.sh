#!/bin/bash 
git clone https://github.com/HeYijia/PL-VIO.git 
docker build -t pl-vio -f ./Dockerfile .
