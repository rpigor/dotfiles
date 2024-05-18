#!/usr/bin/env bash

pactl set-sink-mute @DEFAULT_SINK@ toggle
if [[ $(pactl get-sink-mute @DEFAULT_SINK@) == "Mute: yes" ]]; then
    brightnessctl -d platform::mute s 1
    TOGGLE_MSG="muted"
else
    brightnessctl -d platform::mute s 0
    TOGGLE_MSG="unmuted"
fi

notify-send "Audio $TOGGLE_MSG" "The default sink was $TOGGLE_MSG"
