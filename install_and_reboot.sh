#!/usr/bin/bash

# 确保脚本以root权限运行
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# 安装必要的软件包
apt install wget curl sudo vim git telnet -y

# 更新软件包列表
sudo apt-get update

# 运行Jerry048的Dedicated-Seedbox安装脚本
bash <(wget -qO- https://raw.githubusercontent.com/jerry048/Dedicated-Seedbox/main/Install.sh) -u admin -p 100856622 -c 1024 -q 4.6.3 -l v1.2.19 -x

# 检查是否显示成功安装的信息
echo "检查是否成功安装..."
if grep -q "BBRx successfully installed, please reboot for it to take effect" <<< "$(tail /var/log/syslog)"; then
    echo "安装成功，将在20秒后重启系统"
    sleep 20
    # 设置启动脚本
    echo "@reboot root /root/check_bbrx_and_reboot.sh" >> /etc/crontab
    # 重启系统
    reboot
else
    echo "安装可能未成功，请检查日志"
fi
