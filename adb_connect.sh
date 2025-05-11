#!/bin/bash

IP='192.168.0.3'

if dpkg -s nmap &>/dev/null; then
  sudo apt install -y nmap
fi

adb connect ${IP}:$(nmap ${IP} -p 37000-44000 | awk "/\/tcp/" | cut -d/ -f1)
