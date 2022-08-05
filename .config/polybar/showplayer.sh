#!/bin/bash

wmctrl -a $(echo "$(nowplaying)")
#
#if $(pgrep -x "spotify" >/dev/null) ; then
#dkcmd win "spotify" focus;
#wmctrl -a $(echo "$(nowplaying)";fi
#
#if $(pgrep -x "clementine" >/dev/null); then
#dkcmd win "clementine" focus;
#wmctrl -a $(echo "$(nowplaying)";fi
#
#if $(pgrep -x "cmus" >/dev/null); then
#dkcmd win "cmus" focus;
#wmctrl -a $(echo "$(nowplaying)" ;fi
