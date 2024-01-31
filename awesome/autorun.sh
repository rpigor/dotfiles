#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

run xset dpms 0 0 600
run xss-lock -- i3lock-fancy -f Iosevka-NF -- scrot -z -o

run picom

run nm-applet
run blueman-applet
run flameshot

run redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}')
