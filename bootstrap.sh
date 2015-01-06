#!/bin/bash

wget https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m`
sudo mv fig-`uname -s`-`uname -m` /usr/local/bin/fig
sudo chmod +x /usr/local/bin/fig

sudo fig up -d
sudo fig rm --force
