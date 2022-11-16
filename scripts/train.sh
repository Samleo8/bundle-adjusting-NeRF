#!/bin/bash

print_usage() {
    echo "Usage: $0 <llff|blender> <group_name> [scene [name]]"
}

# Dataset
DATASET=$1

# Valid scenes
VALID_SCENES_LLFF=("fern" "flower" "fortress" "horns" "leaves" "orchids" "room" "trex")
VALID_SCENES_BLENDER=("chair" "drums" "ficus" "hotdog" "lego" "materials" "mic" "ship")

# Get valid scenes
case $DATASET in
'llff')
    VALID_SCENES=("${VALID_SCENES_LLFF[@]}")
    ;;
'blender')
    VALID_SCENES=("${VALID_SCENES_BLENDER[@]}")
    ;;
*)
    echo "Invalid dataset: $DATASET"
    print_usage
    exit 1
    ;;
esac

# Group name
GROUP=$2

if [ -z "$GROUP" ]; then
    echo "Group name not specified"
    print_usage
    exit 1
fi

# Scene
SCENE=${3:-${VALID_SCENES[0]}}
NAME=${4:-${SCENE}}

if [[ ! " ${VALID_SCENES[@]} " =~ " ${SCENE} " ]]; then
    echo "Invalid scene name: $SCENE"
    exit 1
fi

# Actually train
echo "Training on blender scene ${SCENE} with group ${GROUP}"
python3 train.py --group=$GROUP --model=barf --yaml=barf_$DATASET --name=$NAME --data.scene=$SCENE --barf_c2f=[0.1,0.5]
