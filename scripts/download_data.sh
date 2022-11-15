#!/bin/bash

dl_blender() {
    # Blender
    gdown --id 18JxhpWD-4ZmuFKLzKlAw-w5PpzZxXOcG # download nerf_synthetic.zip
    unzip nerf_synthetic.zip
    rm -f nerf_synthetic.zip
    mv nerf_synthetic data/blender
}

dl_llff() {
    # LLFF
    gdown --id 16VnMcF1KJYxN9QId6TClMsZRahHNMW5g # download nerf_llff_data.zip
    unzip nerf_llff_data.zip
    rm -f nerf_llff_data.zip
    mv nerf_llff_data data/llff
}

case $1 in
'blender')
    dl_blender
    ;;
'llff')
    dl_llff
    ;;
'both' | 'all')
    dl_blender
    dl_llff
    ;;
*)
    echo "Usage: $0 [blender|llff|both]"
    exit 1
    ;;
esac
