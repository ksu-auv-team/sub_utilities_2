#!/bin/bash
sudo usermod -a -G dialout $USER
sudo apt-get remove modemmanager -y
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y
sudo apt install libqt5gui5 -y
sudo apt install libfuse2 -y

mkdir ground
cd ground
wget https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage
chmod u+x QGroundControl.AppImage
./QGroundControl.AppImage