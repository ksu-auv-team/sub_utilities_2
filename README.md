# SUB UTILITIES 2

This is our new sub utilities repo for the software rewrite.

## Installation
So, you're on a new computer and you want to start working on the sub?

Well, you've come to the right place.

A Couple of things to note, is you want to use `Ubuntu 20.04`. When you first load up the OS, you'll want to install git.

```bash
$ sudo apt install -y git
```
From there, you can clone this repository.
```bash
$ git clone https://github.com/ksu-auv-team/sub_utilities_2
```
**NOTE** You'll want to install this in your user folder so /home/USERNAME

Now, that you have it cloned, let's install all of our dependencies. Fortunately, there's a script for that!

just `cd` into the repository and run this:
```bash
$ bash scripts/install_core.sh
```

Now you should have a working instance!
### Simulation
If you want to simulate the sub, run
```bash
bash scripts/run_sim.sh
```

It should launch a simulation instance that includes, Gazebo, QGroundControl, and a few other dependencies.

From there, you can open QGroundControl to arm the device (that's not automatic yet...) and get an instance running.


### Running
As of 12/13/2022, you can run my script that moves forwards and diagonally (jankily)


Run this from the repository's root folder.
```bash
export ROS_DOMAIN_ID=0
export PYTHONOPTIMIZE=1
source install/setup.bash
ros2 launch subdriver sub.launch.py
```