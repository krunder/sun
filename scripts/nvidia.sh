#!/bin/bash

DRIVER_VERSION=565

sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
sudo apt install -y nvidia-driver-${DRIVER_VERSION}
