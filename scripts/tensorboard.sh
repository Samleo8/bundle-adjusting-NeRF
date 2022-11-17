#!/bin/bash

GROUP=$1
sleep 10s && firefox localhost:6006 &
tensorboard --logdir output/$GROUP
