#!/bin/sh

if [ "$(pgrep -x redshift)" ]; then
        echo "%{F#056405}"
    else
        echo "%{F#056405}"
fi
