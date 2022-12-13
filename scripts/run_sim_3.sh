#!/bin/bash
cwd=$(pwd)
cd $cwd
source ~/.bashrc
source install/setup.bash
ros2 run px4_ros_com offboard_control