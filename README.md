### Docker images for SLAMers
> Once you have config the Dockerfile you can use it everywhere



#### How to use GUI in docker
```bash
# before launching the container, allow display access from local users
xhost +local:

# launch the container
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix:ro imagename 
```
> Note: Addition option `--runtime=nvidia` is needed if you use NVIDIA graphics card(s)
