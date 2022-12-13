#!/bin/bash
cwd=~/sub_utilities_2
cd $cwd
source ~/.bashrc
cd ~/microros_ws
source install/local_setup.sh
export ROS_DOMAIN_ID=0
export PYTHONOPTIMIZE=1
ros2 run micro_ros_agent micro_ros_agent udp4 --port 8888 ROS_DOMAIN_ID=0