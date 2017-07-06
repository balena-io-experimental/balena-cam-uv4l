FROM resin/%%RESIN_MACHINE_NAME%%-debian:jessie

# Install the UV4L PPA
RUN curl -s http://www.linux-projects.org/listing/uv4l_repo/lrkey.asc | sudo apt-key add - &&\
  sed -i '1s;^;deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/ jessie main\n;' /etc/apt/sources.list

# Install dependencies as well as the proper version of uv4l-webrtc
RUN apt-get update -q &&\
  apt-get install -yq \
    uv4l \
    uv4l-demos \
    uv4l-dummy \
    uv4l-mjpegstream \
    uv4l-raspicam \
    uv4l-raspicam-extras \
    uv4l-raspidisp \
    uv4l-server \
    uv4l-uvc \
    uv4l-xmpp-bridge \
    uv4l-xscreen \
    uv4l-webrtc$([ $(uname -m) = armv6l ] && echo -armv6) \
    vlc \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Move to app dir
WORKDIR /usr/src/app

# Configure env vars
ENV CONF_DIR=/data/config/ \
  INITSYSTEM=on

# Copy over our project files
COPY ./app/ /usr/src/app/
COPY ./config/ /usr/src/app/config/

# Disable uv4l_raspicam service which we'll manually start later
RUN systemctl disable uv4l_raspicam

# Start app
CMD ["/bin/bash", "/usr/src/app/start.sh"]
