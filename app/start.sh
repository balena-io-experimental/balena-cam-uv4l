#!/bin/bash

source ./set_option.sh

CONF_FILE=${CONF_DIR}uv4l.conf

# Copy the new config file to ${CONF_DIR}
cp -r /usr/src/app/config ${CONF_DIR}

# Reconfigure uv4l.conf
set_option text-filename ${CONF_DIR}text.json ${CONF_FILE}

# Resin environment variables
set_option height ${height} ${CONF_FILE}
set_option width ${width} ${CONF_FILE}
set_option framerate ${framerate} ${CONF_FILE}
set_option rotation ${rotation} ${CONF_FILE}

# Reconfigure the UV4L service
sed -i "s^/etc/uv4l/uv4l-raspicam.conf^${CONF_FILE}^g" /etc/init.d/uv4l_raspicam

# Start UV4L
systemctl start uv4l_raspicam
