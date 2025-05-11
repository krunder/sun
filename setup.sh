#!/bin/bash

echo "Setting up..."
sudo apt update

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt clean -y
