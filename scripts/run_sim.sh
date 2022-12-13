#!/bin/bash
sudo apt install -y screen
screen -dmS sim1
screen -S sim1 -X stuff "xterm -e bash scripts/run_sim_1.sh\n"
screen -dmS sim2
screen -S sim2 -X stuff "xterm -e bash scripts/run_sim_2.sh\n"
screen -dmS sim3
screen -S sim3 -X stuff "xterm -e bash scripts/run_sim_3.sh\n"