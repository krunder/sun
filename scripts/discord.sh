#!/bin/bash

curl -L -o $HOME/discord.deb https://discord.com/api/download?platform=linux&format=deb 
sudo apt install -y $HOME/discord.deb || rm -f $HOME/discord.deb