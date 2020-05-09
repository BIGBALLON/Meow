# Deep Learning Tools

## CUDA Installation

- Official doc: 
    - [nvidia-cuda](https://docs.nvidia.com/cuda/index.html)
- Previous note:
    - [PyTorch-install.md](https://github.com/BIGBALLON/cifar-10-cnn/blob/master/doc/PyTorch-install.md)


PS: To install the Display Driver, the Nouveau drivers must first be disabled. Each distribution of Linux has a different method for disabling Nouveau. The Nouveau drivers are loaded if the following command prints anything: ``lsmod | grep nouveau``

## cuDNN Installation

- Official doc: 
    - [nvidia-deeplearning](https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html)
- Previous note:
    - [PyTorch-install.md](https://github.com/BIGBALLON/cifar-10-cnn/blob/master/doc/PyTorch-install.md)

```bash
# 1. Navigate to your <cudnnpath> directory containing the cuDNN Tar file.
# 2. Unzip the cuDNN package.
tar -xzvf cudnn-x.x-linux-x64-v8.x.x.x.tgz
# 3. Copy the following files into the CUDA Toolkit directory, and change the file permissions.
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/include/cudnn_version.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```

## Check CUDA version

```bash
cat /usr/local/cuda/version.txt

# CUDA Version 10.2.89

nvcc--version 

# nvcc: NVIDIA (R) Cuda compiler driver
# Copyright (c) 2005-2019 NVIDIA Corporation
# Built on Wed_Oct_23_19:24:38_PDT_2019
# Cuda compilation tools, release 10.2, V10.2.89
```

## Check cuDNN version


```bash
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2 

#define CUDNN_MAJOR 7
#define CUDNN_MINOR 6
#define CUDNN_PATCHLEVEL 5
--
#define CUDNN_VERSION (CUDNN_MAJOR * 1000 + CUDNN_MINOR * 100 + CUDNN_PATCHLEVEL)

#include "driver_types.h"
```


## Visit Tensorboard via SSH

```
ssh -L 12306:127.0.0.1:12306 account@server.address

# see https://zhuanlan.zhihu.com/p/57630633
# and https://stackoverflow.com/questions/38513333/is-it-possible-to-see-tensorboard-over-ssh
```

