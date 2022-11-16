#!/bin/bash

print_usage() {
    echo "Usage: $0 <llff|blender> <group_name>"
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

# Loop through all scenes and train them (sequentially)
for SCENE in "${VALID_SCENES[@]}"; do
    ./scripts/train.sh $DATASET $GROUP $SCENE $SCENE
done
