FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNING yes

RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    apt-get update &&\
    apt-get upgrade -y -qq --no-install-recommends && \
    apt-get install -y -qq \
    apt-utils \
    build-essential \
    cmake \
    git \
    vim \
    curl \
    wget \
    libboost-all-dev\
    python3.5 \
    python3-pip \
    libceres-dev \
    pkg-config \
    tar \
    unzip 


# install g2o dependences
RUN apt-get install -y -qq \
    libgoogle-glog-dev \
    libatlas-base-dev \
    libsuitesparse-dev 
                                                                                                                               
# opencv dependences 
RUN apt-get install -y -qq \
    libgtk-3-dev \
    libjpeg-dev \
    libpng++-dev \
    libtiff-dev \
    libopenexr-dev \
    libwebp-dev \
    ffmpeg \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswscale-dev \
    libavresample-dev 

# pangolin dependences
RUN apt-get install -y -qq \
    libglew-dev


# install opencv via apt-get
RUN apt-get install -y -qq libopencv-dev

RUN apt-get install cmake -y -qq

# build g2o 
COPY ./g2o /tmp
WORKDIR /tmp
RUN set -x && \
  cd g2o && \
  mkdir -p build && \
  cd build && \
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_UNITTESTS=OFF \
    -DBUILD_WITH_MARCH_NATIVE=ON \
    -DG2O_USE_CHOLMOD=ON \
    -DG2O_USE_CSPARSE=ON \
    -DG2O_USE_OPENGL=OFF \
    -DG2O_USE_OPENMP=ON \
    -DG2O_BUILD_APPS=OFF \
    -DG2O_BUILD_EXAMPLES=OFF \
    -DG2O_BUILD_LINKED_APPS=OFF \
    .. && \
  make && \
  make install && \
  cd /tmp && \
  rm -rf *

# build Pangolin
COPY ./Pangolin /tmp
WORKDIR /tmp
RUN cd Pangolin && \
  mkdir -p build && \
  cd build && \
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_PANGOLIN_DEPTHSENSE=OFF \
    -DBUILD_PANGOLIN_FFMPEG=OFF \
    -DBUILD_PANGOLIN_LIBDC1394=OFF \
    -DBUILD_PANGOLIN_LIBJPEG=OFF \
    -DBUILD_PANGOLIN_LIBOPENEXR=OFF \
    -DBUILD_PANGOLIN_LIBPNG=OFF \
    -DBUILD_PANGOLIN_LIBREALSENSE=OFF \
    -DBUILD_PANGOLIN_LIBREALSENSE2=OFF \
    -DBUILD_PANGOLIN_LIBTIFF=OFF \
    -DBUILD_PANGOLIN_LIBUVC=OFF \
    -DBUILD_PANGOLIN_LZ4=OFF \
    -DBUILD_PANGOLIN_OPENNI=OFF \
    -DBUILD_PANGOLIN_OPENNI2=OFF \
    -DBUILD_PANGOLIN_PLEORA=OFF \
    -DBUILD_PANGOLIN_PYTHON=OFF \
    -DBUILD_PANGOLIN_TELICAM=OFF \
    -DBUILD_PANGOLIN_TOON=OFF \
    -DBUILD_PANGOLIN_UVC_MEDIAFOUNDATION=OFF \
    -DBUILD_PANGOLIN_V4L=OFF \
    -DBUILD_PANGOLIN_VIDEO=OFF \
    -DBUILD_PANGOLIN_ZSTD=OFF \
    -DBUILD_PYPANGOLIN_MODULE=OFF \
  .. && \
  make && \
  make install && \
  cd /tmp && \
  rm -rf *

# build sophus
COPY ./Sophus /tmp
WORKDIR /tmp
RUN cd Sophus && \
  mkdir -p build && \
  cd buuld && \
  cmake \
    -DBUILD_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF\
  .. && \
  make && \
  make install && \
  cd /tmp && \
  rm -rf *


