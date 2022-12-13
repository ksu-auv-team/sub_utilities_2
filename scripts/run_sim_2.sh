#!/bin/bash
cwd=$(pwd)
cd $cwd
source ~/.bashrc
cd ~/PX4-Autopilot
python3 msg/tools/uorb_to_ros_msgs.py msg/ px4_msgs/msg/
mv $cwd/src/px4_msgs/msg $cwd/src/px4_msgs/msg-bk
mv px4_msgs/msg $cwd/src/px4_msgs/
cd $cwd
rm -rf build/ install/ log/
colcon build
source install/setup.bash
micrortps_agent -t UDP
