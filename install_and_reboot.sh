#!/bin/bash

# 安装必要的软件包
apt install wget curl sudo vim git telnet -y

# 更新软件包列表
sudo apt-get update

# 运行Jerry048的Dedicated-Seedbox安装脚本
bash <(wget -qO- https://raw.githubusercontent.com/jerry048/Dedicated-Seedbox/main/Install.sh) -u admin -p 100856622 -c 1024 -q 4.6.3 -l v1.2.19 -x

# 等待150秒
sleep 150

# 重启系统
reboot
