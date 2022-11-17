#!/bin/bash

GROUP=$1
sleep 15s && firefox localhost:6006 &
tensorboard --logdir output/$GROUP
