FROM ros:kinetic-perception

ENV CATKIN_WS="/root/catkin_ws"

# change software sources both ros and ubuntu system sources, 
# remove it if you don't need it 

RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'


RUN apt-get update && \
    apt-get install -y -qq \
    cmake 	\
    apt-utils \
    libatlas-base-dev \
    libgoogle-glog-dev \
    libsuitesparse-dev \
    python-catkin-tools \
    ros-${ROS_DISTRO}-cv-bridge \
    ros-${ROS_DISTRO}-image-transport \
    ros-${ROS_DISTRO}-message-filters \
    ros-${ROS_DISTRO}-tf \
    libceres-dev 

WORKDIR ${CATKIN_WS}/src
COPY ./PL-VIO  ${CATKIN_WS}/src

WORKDIR ${CATKIN_WS}

RUN catkin config --extend /opt/ros/${ROS_DISTRO} --cmake-args \
    -DCMAKE_BUILD_TYPE=Release && \
    catkin build camera_model && \
    catkin build && \
    sed -i '/exec "$@"/i source "/root/catkin_ws/devel/setup.bash"' /ros_entrypoint.sh
