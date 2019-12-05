#!/bin/bash

# use to enable docker container connect to the X server 
xhost +local:  
docker run -it --rm --net=host  -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix/:/tmp/.X11-unix:ro pl-vio 
