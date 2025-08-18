#!/usr/bin/env bash

# force current directory to be scripts/ folder
cd $(dirname $(realpath $0))

# go to root of the repo
cd ..

# backup secret files
mv esphome/secrets.yaml esphome/secrets.yaml.backup
mv homeassistant/secrets.yaml homeassistant/secrets.yaml.backup

# remove all temp files
git clean -fdX

# restore secret files back
mv esphome/secrets.yaml.backup esphome/secrets.yaml
mv homeassistant/secrets.yaml.backup homeassistant/secrets.yaml
