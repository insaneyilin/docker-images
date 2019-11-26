FROM ros:kinetic-perception
ENV NET_FLAG="mainland" 

ENV VINS_URL="https://github.com/HKUST-Aerial-Robotics/VINS-Mono.git"
ENV CERES_URL_GITEE="https://gitee.com/mirrors/ceres-solver.git"
ENV CERES_URL_GITHUB="https://github.com/ceres-solver/ceres-solver.git"
ENV CATKIN_WS="/root/catkin_ws"

ENV NUM_THREADS=4


RUN if [ ${NET_FLAG} = "mainland" ]; then \
    sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list; \
    sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list; \
    fi && \
    apt-get update &&\
    apt-get install -y -qq \
    cmake 	\
    libatlas-base-dev \
    libgoogle-glog-dev \
    libsuitesparse-dev \
    python-catkin-tools \
    ros-${ROS_DISTRO}-cv-bridge \
    ros-${ROS_DISTRO}-image-transport \
    ros-${ROS_DISTRO}-message-filters \
    ros-${ROS_DISTRO}-tf &&\
    rm -rf /var/lib/apt/lists/* && \
    if [ ${NET_FLAG}="mainland" ];then \
    git clone ${CERES_URL_GITEE};\
    else git clone ${CERES_URL_GITHUB};fi &&\
    cd ceres-solver &&\
    mkdir build && cd build && cmake .. && \
    make install 


WORKDIR ${CATKIN_WS}/src

ENV TERM xterm
ENV PYTHONIOENCODING UTF-8
COPY ./source_code/VINS-Mono ${CATKIN_WS}/src/

WORKDIR ${CATKIN_WS}
RUN catkin config \
	--extend /opt/ros/${ROS_DISTRO} \
	--cmake-args \
	 -DCMAKE_BUILD_TYPE=Release && \
    catkin build && \
    sed -i '/exec "$@"/i source "/root/catkin_ws/devel/setup.bash"' /ros_entrypoint.sh
