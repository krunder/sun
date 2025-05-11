#!/bin/bash

path=$( dirname "$0" )

CONFIG_DIR="$HOME/.config/pipewire"

rm -rf $CONFIG_DIR && cp -r $path/../config/pipewire $CONFIG_DIR
