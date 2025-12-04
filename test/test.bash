#!/bin/bash
set -e  # 一旦出错就退出

dir=~
[ "$1" != "" ] && dir="$1"

cd "$dir/ros2_ws"

# 使用 setup.bash 而不是 .bashrc，更适合ROS环境
source /opt/ros/humble/setup.bash || {
  echo "ROS环境未正确设置：/opt/ros/humble/setup.bash 不存在"
  exit 1
}

colcon build

# 再 source 一次构建结果（重要）
source install/setup.bash

# 启动 launch 文件并检查输出
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log || {
  echo "ros2 launch 执行失败"
  cat /tmp/mypkg.log
  exit 1
}

# 检查期望输出
if ! grep -q 'Listen: 10' /tmp/mypkg.log; then
  echo "未检测到 Listen: 10"
  cat /tmp/mypkg.log
  exit 1
fi
