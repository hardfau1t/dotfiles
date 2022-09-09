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

function connect(){
    declare -A address
    devices=`bluetoothctl devices | cut -d ' ' -f 2-`
    IFS=$'\n'
     for dev in `bluetoothctl devices | cut -d  ' ' -f 2-`
     do
         name=(`echo -n "$dev" | cut -d ' ' -f 2-`)
         names+=("$name")
         address["$name"]="$(echo -n "$dev" | cut -d ' ' -f 1)"
     done
     bluetoothctl connect "${address[`echo "${names[*]}" | fuzzel -d 2>/dev/null`]}"
}

function toggle(){
    if bluetoothctl show  | rg -i 'powered'| rg -o 'no' > /dev/null
    then
        # power on device
        bluetoothctl power on > /dev/null
        echo ""
        connect
    else
        # poweroff
        bluetoothctl power off > /dev/null
        echo ""
    fi

}

while getopts ":stc" opt
do
    case $opt in 
        s) status ;;
        t) toggle ;;
        c) connect ;;
        *) exit 1;;
    esac
done
