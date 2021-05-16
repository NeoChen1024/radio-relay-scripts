#!/usr/bin/env sh

alias ctl="rigctl -m 4"

siglevel="▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▀"

all="$(ctl f m)"

freq="$(sed '1!d' <<< "$all")"
freq="`bc <<< "$freq / 1000"`kc" # c to kc
mode="$(sed '2!d' <<< "$all")"
bw="$(sed '3!d' <<< "$all")"

echo "f=$freq"
echo "Mode: $mode, BW=$bw"
