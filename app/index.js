#!/bin/env node

{
    const fs = require('fs');
    const exec = require('child_process').exec;
    const chalk = require("chalk");
    const request = require('request');
    const display = require(__dirname + '/libs/display.js');
    const debug = require('debug')('main');

    display.init(() => {
        'use strict';
        display.image(display.presets.splash);
    });

    console.log(chalk.cyan('starting UV4L on port 80...'));
    exec('systemctl start uv4l_raspicam', (error, stdout, stderr) => {
        'use strict';
        if (error) {
            console.log(chalk.red(`exec error: ${error}`));
            return;
        }
        console.log(chalk.green(`stdout: ${stdout}`));
        console.log(chalk.red(`stderr: ${stderr}`));
    });

    setInterval(function keepalive() {
        'use strict';
        request(process.env.RESIN_SUPERVISOR_ADDRESS + '/v1/device?apikey=' + process.env.RESIN_SUPERVISOR_API_KEY, function(error, response, body) {
            if (!error && response.statusCode == 200) {
                body = JSON.parse(body);
                debug('supervisor', body);
                switch (body.status) {
                    case "Idle":
                        display.image(display.presets.smile);
                        break;
                    case "Installing":
                        display.image(display.presets.busy);
                        break;
                    case "Downloading":
                        display.image(display.presets.download);
                        break;
                    case "Starting":
                        display.image(display.presets.fwd);
                        break;
                    case "Stopping":
                        display.image(display.presets.stop);
                        break;
                }
            }
        });
    }, 500);

}
