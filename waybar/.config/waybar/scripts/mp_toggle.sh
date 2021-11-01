#!/usr/bin/bash

if systemctl status --user mp_rater.service >/dev/null
then
    systemctl stop --user mp_rater.service
else
    systemctl start --user mp_rater.service
fi
