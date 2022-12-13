#!/bin/bash

dir=~/sub_utilities_2

cd ..
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
cd PX4-Autopilot
cd ..
bash ./PX4-Autopilot/Tools/setup/ubuntu.sh

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install gradle 6.3

git clone --recursive https://github.com/eProsima/Fast-DDS-Gen.git -b v1.0.4 ~/Fast-RTPS-Gen
cd ~/Fast-RTPS-Gen
gradle assemble
sudo env "PATH=$PATH" gradle install

sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt update && sudo apt install -y curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt install -y ros-foxy-desktop

echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install -y python3-colcon-common-extensions
sudo apt install -y ros-foxy-eigen3-cmake-module
sudo pip3 install -U empy pyros-genmsg setuptools==58.2.0
sudo apt install -y ros-foxy-gazebo-ros-pkgs

git clone https://github.com/PX4/px4_ros_com.git $dir/src/px4_ros_com
git clone https://github.com/PX4/px4_msgs.git $dir/src/px4_msgs

echo $dir
sudo apt install -y xterm
xterm -e "cd ~/sub_utilities_2/src/px4_ros_com/scripts && source build_ros2_workspace.bash"
cd $dir

echo $dir

echo "source ~/sub_utilities_2/install/setup.bash" >> ~/.bashrc


sudo pip3 install -U rosinstall vcstools rospkg rosdep
cd ~
mkdir ~/microros_ws
cd microros_ws
git clone -b $ROS_DISTRO https://github.com/micro-ROS/micro_ros_setup.git
mkdir src
mv micro_ros_setup/ src/
colcon build
source install/local_setup.sh
sudo rosdep init
rosdep update
ros2 run micro_ros_setup create_agent_ws.sh
ros2 run micro_ros_setup build_agent.sh

cd $dir
echo $dir