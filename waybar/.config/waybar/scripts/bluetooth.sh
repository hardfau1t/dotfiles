#!/usr/bin/bash

function status(){
    # power off
    if bluetoothctl show  | rg -i 'powered'| rg -o 'no' > /dev/null
    then
        echo ""
    elif bluetoothctl show  | rg -i 'powered'| rg -o 'yes'> /dev/null
    then
        # connected
        if bluetoothctl info  | rg -i 'Paired'| rg -o 'yes'> /dev/null
        then
            echo ""
        elif bluetoothctl show  | rg -i 'Discovering' | rg -o 'yes' > /dev/null
        then
            echo ""
        # power on
        else
            echo ""
        # scanning
            echo ""
        fi
    else
        exit 2
    fi
}

function toggle(){
    if bluetoothctl show  | rg -i 'powered'| rg -o 'no' > /dev/null
    then
        # power on device
        bluetoothctl power on > /dev/null
        echo ""
        # list 
         bluetoothctl devices | wofi --show dmenu 2> /dev/null  | cut -d " " -f2| xargs bluetoothctl connect 
        # bluetoothctl --timeout 2 scan on | tail +3 | wofi --show dmenu | xargs bluetoothctl connect
        # connect
    else
        # poweroff
        bluetoothctl power off > /dev/null
        echo ""
    fi

}

while getopts ":st" opt
do
    case $opt in 
        s) status ;;
        t) toggle ;;
        *) exit 1;;
    esac
done
