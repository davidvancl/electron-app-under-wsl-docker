#!/bin/bash

#VNC part
mkdir -p $HOME/.vnc
chmod go-rwx $HOME/.vnc
vncpasswd -f <<< $VNC_SECRET > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd
#start vnc and run app
cd $HOME
vncserver
export DISPLAY=:1

/bin/bash