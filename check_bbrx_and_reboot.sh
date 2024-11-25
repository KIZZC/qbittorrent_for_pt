#!/bin/bash

# 等待系统完全启动
sleep 60
# 替换qbittorrent配置文件
sudo wget -O /home/admin/.config/qBittorrent/qBittorrent.conf https://raw.githubusercontent.com/KIZZC/qbittorrent_for_pt/refs/heads/main/qBittorrent.conf

# 检查标记文件是否存在，避免循环重启
if [ ! -f "/var/run/rebooted_once" ]; then
    # 创建标记文件
    touch /var/run/rebooted_once

    # 等待600秒
    sleep 600

    # 再次重启系统
    reboot
fi
