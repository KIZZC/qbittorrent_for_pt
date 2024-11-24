#!/usr/bin/bash

# 等待系统完全启动
sleep 500

# 检查lsmod输出是否包含tcp_bbrx
if lsmod | grep -q "tcp_bbrx"; then
    echo "tcp_bbrx模块已加载，将在10秒后再次重启系统"
    sleep 15
    reboot
else
    echo "tcp_bbrx模块未加载，请检查安装和配置"
fi
