#!/usr/bin/env zsh

alias set_mute="pactl set-source-mute alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo"

case "$1" in
	mute)	set_mute true;;
	unmute)	set_mute false;;
esac
