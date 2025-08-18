#!/usr/bin/env bash

# force current directory to be scripts/ folder
cd $(dirname $(realpath $0))

# skip home assistant onboarding
mkdir -p ../homeassistant/.storage/
echo '{"version":4,"minor_version":1,"key":"onboarding","data":{"done":["core_config","analytics","integration"]}}' \
  > ../homeassistant/.storage/onboarding

# run home assistant
docker run -d \
  --name homeassistant \
  --restart=unless-stopped \
  -v ../homeassistant:/config \
  --workdir /config \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable

# run esphome
esphome dashboard ../esphome > /dev/null 2>&1 &