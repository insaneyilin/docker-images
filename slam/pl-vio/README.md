### Dockerfile for pl-vio

#### Build

Make sure the directory structure like follow:

+ pl-vio
  + Dockerfile
  + run.sh
  + build.sh

```bash
./run.sh
```

#### Run

`step1`: 

```bash
./run.sh
# in the container shell
roslaunch plvio_estimator euroc.launch
```

`step2`:

```bash
rosbag play   [path-to-EuRoc-dataset]/MH_01_easy.bag
```



