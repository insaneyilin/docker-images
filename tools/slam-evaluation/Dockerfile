FROM ros:kinetic

RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list

# install packages 
RUN apt-get update && \
    apt-get install -y -qq \
    python-pip 

# modify pip mirrors
RUN mkdir .pip && echo "[global] \n index-url=https://pypi.tuna.tsinghua.edu.cn/simple" >> .pip/pip.conf
RUN pip install evo --upgrade --no-binary evo

WORKDIR / 

