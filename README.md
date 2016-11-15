# [WIP] resin-cam
A smart, Raspberry Pi based streaming camera

## Getting started

- Sign up on [resin.io](https://dashboard.resin.io/signup)
- go throught the [getting started guide](http://docs.resin.io/raspberrypi/nodejs/getting-started/) and create a new application called `resincam`
- clone this repository to your local workspace
- set these variables in the `Fleet Configuration` application side tab

  - `RESIN_HOST_CONFIG_gpu_mem` = `160`
  - `RESIN_HOST_CONFIG_disable_camera_led` = `1`
  - `RESIN_HOST_CONFIG_start_x` = `1`

- add the _resin remote_ to your local workspace using the useful shortcut in the dashboard UI ![remoteadd](https://raw.githubusercontent.com/resin-io-playground/boombeastic/master/docs/gitresinremote.png)
- `git push resin master`
- see the magic happening, your device is getting updated Over-The-Air!
- after the OTA is completed, you should be able to point your browser to `<resincamIP>:80/stream` (get the device IP from the resin dashboard)

## Configure via [environment variables](https://docs.resin.io/management/env-vars/)
Variable Name | Default | Description
------------ | ------------- | -------------
PORTAL_SSID | `ResinAP` | the SSID name of the Access Point the device spawns for WiFi configuration

## License

Copyright 2016 Resinio Ltd.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
