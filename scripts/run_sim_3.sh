#!/bin/bash
cwd=~/sub_utilities_2
cd $cwd
if [ ! -d $cwd/ground ]; then
    bash scripts/install_groundstation.sh
fi
bash scripts/run_groundstation.sh