#!/bin/bash

dir=~/sub_utilities_2

cd $dir

xterm -e "cd ~/sub_utilities_2/src/px4_ros_com/scripts && source build_ros2_workspace.bash"
source ~/.bashrc