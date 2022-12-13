#!/bin/bash
cwd=$(pwd)
cd $cwd
cd ..
cd ~/PX4-Autopilot
source ~/.bashrc
make clean
rm -rf build
make
make px4_sitl_rtps
make px4_sitl_rtps gazebo_uuv_hippocampus
