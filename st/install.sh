#!/bin/bash

patch -p1 < patches/st-alpha-20220206-0.8.5.diff
patch -p1 < patches/st-clipboard-0.8.3.diff

make

sudo make clean install
