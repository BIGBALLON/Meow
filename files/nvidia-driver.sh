#!/bin/bash

set -e

DRIVER_VERSION=$1
curl -O -L "http://us.download.nvidia.com/XFree86/Linux-x86_64/${DRIVER_VERSION}/NVIDIA-Linux-x86_64-${DRIVER_VERSION}.run"
sudo bash "NVIDIA-Linux-x86_64-${DRIVER_VERSION}.run"

# e.g., 440.82 440.64
# For Tasla: http://us.download.nvidia.com/tesla/410.129/NVIDIA-Linux-x86_64-410.129-diagnostic.run
# For GeForce: http://us.download.nvidia.com/XFree86/Linux-x86_64/440.82/NVIDIA-Linux-x86_64-440.82.run