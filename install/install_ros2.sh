#!/bin/bash

cwd=$(pwd)
sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt install -y software-properties-common
sudo add-apt-repository universe

sudo apt install -y make cmake git g++ gcc
mkdir -p ~/px4_ros_com_ros2/src
git clone https://github.com/PX4/px4_ros_com.git ~/px4_ros_com_ros2/src/px4_ros_com
git clone https://github.com/PX4/px4_msgs.git ~/px4_ros_com_ros2/src/px4_msgs

cd ~/px4_ros_com_ros2/src/px4_ros_com/scripts
source setup_system.bash
source build_ros2_workspace.bash


