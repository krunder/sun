#!/bin/bash

curl -L -o $HOME/steam.deb https://cdn.fastly.steamstatic.com/client/installer/steam.deb
sudo apt install -y $HOME/steam.deb || rm -f $HOME/steam.deb
