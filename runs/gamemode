#!/bin/bash

sudo apt install -y gamemode
sudo usermod -aG gamemode $USER
echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
