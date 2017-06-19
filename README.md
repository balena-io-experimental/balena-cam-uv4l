# [WIP] resin-cam
A smart, Raspberry Pi based streaming camera

![resincam in athens](https://github.com/resin-io-playground/resin-cam/raw/master/designs/resincam.JPG)

- **[Bill of Materials](https://github.com/resin-io-playground/resin-cam/blob/master/BoM.md)**

## Getting started

- Sign up on [resin.io](https://dashboard.resin.io/signup)
- Select your Raspberry Pi version and create a new application
- Clone this repository to your local workspace
- Add the _resin remote_ to your local workspace using the useful shortcut in the dashboard UI ![remoteadd](https://raw.githubusercontent.com/resin-io-playground/boombeastic/master/docs/gitresinremote.png)
- Push code yo your device with a simple `git push resin master`
- See the magic happening, your device is getting updated Over-The-Air!
- When your device finishes updating on the Resin Dashboard you should be able to point your browser to `<resincamIP>:80/stream` (get the device IP from the Resin Dashboard)

## Configure via [environment variables](https://docs.resin.io/management/env-vars/)
Variable Name | Default | Description
------------ | ------------- | -------------
width | `640` | video width
height | `480` | video height
framerate | `30` | video framerate
disable_turn | unset | set this if you want to disable the local turn server that will run on your device through Resin's public url

## License

Copyright 2017 Resinio Ltd.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
