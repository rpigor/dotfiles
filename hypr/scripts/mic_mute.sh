#!/usr/bin/env bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle
if [[ $(pactl get-source-mute @DEFAULT_SOURCE@) == "Mute: yes" ]]; then
    brightnessctl -d platform::micmute s 1
    TOGGLE_MSG="muted"
else
    brightnessctl -d platform::micmute s 0
    TOGGLE_MSG="unmuted"
fi

notify-send "Microphone $TOGGLE_MSG" "The default source was $TOGGLE_MSG"
