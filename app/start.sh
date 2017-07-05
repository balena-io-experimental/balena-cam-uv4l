#!/bin/bash

source ./set_option.sh

# Reconfigure uv4l.conf
set_option height $height /usr/src/app/config/uv4l.conf
set_option width $width /usr/src/app/config/uv4l.conf
set_option framerate $framerate /usr/src/app/config/uv4l.conf

# Reconfigure the UV4L service
sed -i 's^/etc/uv4l/uv4l-raspicam.conf^/usr/src/app/config/uv4l.conf^g' /etc/init.d/uv4l_raspicam

# Start UV4L
systemctl start uv4l_raspicam
