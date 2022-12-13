#!/bin/bash
cwd=$(pwd)
cd ~/PX4-Autopilot
export ROS_DOMAIN_ID=0
export PYTHONOPTIMIZE=1
HEADLESS=1 make px4_sitl gazebo_uuv_hippocampus