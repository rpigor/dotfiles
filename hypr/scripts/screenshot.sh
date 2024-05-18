#!/usr/bin/env bash

## This script is based on grimblast, which in turn is based on grimshot.
## https://github.com/hyprwm/contrib/tree/main/grimblast
## https://github.com/swaywm/sway/blob/master/contrib/grimshot
##
## Requirements:
##  - `grim`: screenshot utility for wayland
##  - `slurp`: to select an area
##  - `hyprctl`: to read properties of current window (provided by Hyprland)
##  - `hyprpicker`: to freeze the screen when selecting area
##  - `jq`: json utility to parse hyprctl output
##  - `notify-send`: to show notifications (provided by libnotify)
##  - `mpv`: to play the screenshot sound

tmp_editor_directory() {
    echo "/tmp"
}

notify() {
    notify-send -t 3000 "$@"
}

notifyOk() {
    notify "$@"
}

notifyError() {
    TITLE="Screenshot"
    MESSAGE="Error taking screenshot"
    notify -u critical "$TITLE" "$MESSAGE"
}

resetFade() {
    if [[ -n $FADELAYERS ]]; then
        hyprctl keyword animation "$FADELAYERS" >/dev/null
    fi
}

killHyprpicker() {
    if [ ! $HYPRPICKER_PID -eq -1 ]; then
        kill $HYPRPICKER_PID
    fi
}

takeScreenshot() {
    FILE=$1
    GEOM=$2
    grim -g "$GEOM" "$FILE" || die "Unable to invoke grim"
}

# chef's kiss muah
mpv /usr/share/sounds/freedesktop/stereo/screen-capture.oga &

# freeze screen
hyprpicker -r -z &
sleep 0.2
HYPRPICKER_PID=$!

# get fade & fadeOut animation and unset it
# this removes the black border seen around screenshots
FADELAYERS="$(hyprctl -j animations | jq -jr '.[0][] | select(.name == "fadeLayers") | .name, ",", (if .enabled == true then "1" else "0" end), ",", (.speed|floor), ",", .bezier')"
hyprctl keyword animation 'fadeLayers,0,1,default' >/dev/null

# get screen geometry
GEOM=$(slurp)

# Check if user exited slurp without selecting the area
if [ -z "$GEOM" ]; then
    killHyprpicker
    resetFade
    exit 1
fi

FILE_EDITOR="$(tmp_editor_directory)/$(date -Ins).png"
if takeScreenshot "$FILE_EDITOR" "$GEOM"; then
    resetFade
    killHyprpicker

    TITLE="Screenshot of area"
    MESSAGE="Opened screenshot for annotation"
    notifyOk "$TITLE" "$MESSAGE" -i "$FILE_EDITOR"

    swappy -f "$FILE_EDITOR"
    echo "$FILE_EDITOR"
else
    notifyError
    resetFade
    killHyprpicker
fi
