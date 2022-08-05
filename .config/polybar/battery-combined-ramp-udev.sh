#!/bin/sh

battery_print() {
    PATH_AC="/sys/class/power_supply/AC"
    PATH_BATTERY_0="/sys/class/power_supply/BATA"
    PATH_BATTERY_1="/sys/class/power_supply/BATB"

    ac=0
    battery_level_0=0
    battery_level_1=0
    battery_max_0=0
    battery_max_1=0

    charging=

    if [ -f "$PATH_AC/online" ]; then
        ac=$(cat "$PATH_AC/online")
    fi

    if [ -f "$PATH_BATTERY_0/energy_now" ]; then
        battery_level_0=$(cat "$PATH_BATTERY_0/energy_now")
    fi

    if [ -f "$PATH_BATTERY_0/energy_full" ]; then
        battery_max_0=$(cat "$PATH_BATTERY_0/energy_full")
    fi

    if [ -f "$PATH_BATTERY_1/energy_now" ]; then
        battery_level_1=$(cat "$PATH_BATTERY_1/energy_now")
    fi

    if [ -f "$PATH_BATTERY_1/energy_full" ]; then
        battery_max_1=$(cat "$PATH_BATTERY_1/energy_full")
    fi

#    battery_level_0=$(("$battery_level_0"))
#    battery_level_1=$(("$battery_level_1"))
#    battery_max_0=$(("$battery_max_0"))
#    battery_max_1=$(("$battery_max_1"))
#
    battery_percent_0=$(("$battery_level_0 * 100"))

if [ "$battery_percent_0" -gt 0 ]; then
    battery_percent_0=$(("$battery_percent_0 / $battery_max_0"))
else
    battery_percent_0="0"
fi

    battery_percent_1=$(("$battery_level_1 * 100"))

if [ "$battery_percent_1" -gt 0 ]; then
    battery_percent_1=$(("$battery_percent_1 / $battery_max_1"))
else
    battery_percent_1="0"
fi

if [ "$ac" -eq 1 ]; then
        icon=""
        if [ "$battery_percent_0" -gt 95 ] && [ "$battery_percent_1" -gt 95 ]; then
            echo "$icon"
        
        else
            for (( i=0; i<${#charging}; i++ )); do
                echo -n "${charging:$i:1}$battery_percent_0%"
                echo -n "|"
                echo "${charging:$i:1}$battery_percent_1%"
                sleep 1
            done
        fi
else
    #elif [ "$ac" -lt 1 ]; then
        if [ "$battery_percent_0" -gt 94 ]; then
            icon0=""
        elif [ "$battery_percent_0" -gt 85 ]; then
            icon0=""
        elif [ "$battery_percent_0" -gt 60 ]; then
            icon0=""
        elif [ "$battery_percent_0" -gt 35 ]; then
            icon0=""
        elif [ "$battery_percent_0" -gt 10 ]; then
            icon0=""
        elif [ "$battery_percent_1" -lt 10 ]; then
            icon0=""
        else
            icon0=""
        fi
 
        if [ "$battery_percent_1" -gt 94 ]; then
            icon1=""
        elif [ "$battery_percent_1" -gt 85 ]; then
            icon1=""
        elif [ "$battery_percent_1" -gt 60 ]; then
            icon1=""
        elif [ "$battery_percent_1" -gt 35 ]; then
            icon1=""
        elif [ "$battery_percent_1" -gt 10 ]; then
            icon1=""
        elif [ "$battery_percent_1" -lt 10 ]; then
            icon1=""
         else
            icon1=""
        fi
        echo "$icon0""$battery_percent_0%""|""$icon1""$battery_percent_1%"
fi

}
path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
    --update)
        pid=$(cat $path_pid)

        if [ "$pid" != "" ]; then
            kill -10 "$pid"
        fi
        ;;
    *)
        echo $$ > $path_pid

        trap exit INT
        trap "echo" USR1

        while true; do
            battery_print
            sleep 1 &
            wait
        done
        ;;
esac
