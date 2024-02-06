#!/bin/bash

patch -p1 < st-alpha-20220206-0.8.5.diff

make

sudo make clean install
