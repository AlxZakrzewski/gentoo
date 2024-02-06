#!/bin/bash

patch -p1 < patches/st-scrollback-ringbuffer-0.8.5.diff
patch -p1 < patches/st-alpha-20220206-0.8.5.diff

make

sudo make clean install
