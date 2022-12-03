#!/usr/bin/env bash

re='^-?[0-9]+$'
if ! [[ $1 =~ $re ]]; then
    echo "error: not a number" >&2
    exit 1
fi

value=$1

modes=( "off" "low" "med" "high" )
current_mode=$(asusctl -k | awk '{print $NF}')
next_mode=$( expr ${current_mode} + $value)

if [[ "$next_mode" -ge "0" ]] && [[ "$next_mode" -lt "${#modes[@]}" ]]; then
    asusctl -k ${modes[${next_mode}]}
fi
