### Docker basic images file

#### ubuntu 16.04
+ 修改了软件源为阿里云
+ 安装了基本编译工具
+ apt-get安装了 ceres
+ apt-get安装了 eigen3
#### ubuntu 18.04
+ 修改了软件源为阿里云                                                                                            
+ 安装了基本编译工具                                                                                              
+ apt-get安装了 ceres                                                                                             
+ apt-get安装了 eigen3 

#### slam-basic
> build 前需要手动把`g2o` `pangolin` `sophus`源代码clone到`slam-basic`目录下,主要最近git太慢
+ apt安装了opencv
+ apt安装了ceres
+ 源码安装了g2o: <https://github.com/RainerKuemmerle/g2o.git>
+ 源码安装了pangolin: <https://github.com/stevenlovegrove/Pangolin.git>
+ 源码安装了sophus: <https://github.com/strasdat/Sophus.git>

