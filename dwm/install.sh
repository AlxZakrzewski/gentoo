#!/bin/bash

patch -p1 < patches/dwm-actualfullscreen-20211013-cb3f58a.patch
patch -p1 < patches/dwm-fullgaps-20200508-7b77734.diff
patch -p1 < patches/dwm-swallow-6.3.diff

F=config.def.h
sed -i s/Mod1Mask/Mod4Mask/g $F
sed -i 's/{ "1", "2", "3", "4", "5", "6", "7", "8", "9" }/{ "1", "2", "3" }/g' $F
sed -i 's/borderpx  = 1/borderpx  = 0/g' $F
sed -i 's/col_cyan\[\]        = "#005577"/col_cyan\[\]        = "#24445c"/g' $F
sed -i 's/{ "St"/{ "st-256color"/g' $F
sed -i '/class     instance  title           tags mask  isfloating/a \    { \"clipmenu\",     NULL,       NULL,       1 \<\< 0,       False,       -1 \},' $F
sed -i '/key        function        argument/a\    \{ MODKEY,                       XK_o,      spawn,          \{\.v = clipmenumd \} \},' $F
sed -i '/\/\* commands \*\//a\static const char  *clipmenumd[] ={ "clipmenu",  NULL };\' $F

make

sudo make clean install
