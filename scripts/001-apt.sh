#!/bin/bash

sudo dpkg-divert --rename --divert /etc/apt/apt.conf.d/20apt-esm-hook.conf.disabled --add /etc/apt/apt.conf.d/20apt-esm-hook.conf
