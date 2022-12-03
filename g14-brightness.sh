#!/usr/bin/env bash

re='^-?[0-9]+$'
if ! [[ $1 =~ $re ]]; then
    echo "error: not a number" >&2
    exit 1
fi

value=$1

brightness=$(expr $(cat /sys/class/backlight/amdgpu_bl0/brightness) + $value)
echo ${brightness} | sudo tee /sys/class/backlight/amdgpu_bl0/brightness
