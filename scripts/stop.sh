#!/usr/bin/env bash

# stop home assistant
docker stop homeassistant
docker rm homeassistant

# stop esphome
ESPHOME_PID=$(ps | grep esphome | grep -v grep | awk '{print $1}')
kill $ESPHOME_PID
