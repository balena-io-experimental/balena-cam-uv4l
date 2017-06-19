#!/bin/bash

# Start turn server as daemon if enabled
# [ ! -z ${disable_turn+x} ] || turnserver --no-stun --no-cli --no-multicast-peers -o

source ./set_option.sh

# Reconfigure uv4l.conf
set_option height $height /usr/src/app/config/uv4l.conf
set_option width $width /usr/src/app/config/uv4l.conf
set_option framerate $framerate /usr/src/app/config/uv4l.conf

# Reconfigure the uv4l service
sed -i 's^/etc/uv4l/uv4l-raspicam.conf^/usr/src/app/config/uv4l.conf^g' /etc/init.d/uv4l_raspicam

# Start uv4l
systemctl start uv4l_raspicam
