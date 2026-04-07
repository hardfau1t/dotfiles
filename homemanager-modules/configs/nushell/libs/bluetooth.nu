use std log

export def "bctl" [...args] {
    bluetoothctl ...$args
}

export def "bctl reset" [device_id?: string =  '0000:03:00.4'] {
    echo  $device_id
        | sudo tee /sys/bus/pci/drivers/xhci_hcd/unbind 
        | ignore
    sleep 3sec 
    echo  $device_id
        | sudo tee /sys/bus/pci/drivers/xhci_hcd/bind
        | ignore
    log info $"($device_id) is restarted"
}

def select_device [devices] {
        let index = $devices.name | input list --index --fuzzy "Select device"
        if $index == null {
            log warning "Nothing is selected. Not connecting"
            error make {msg: "device missing", }
        }
        $devices.id | get $index

}

export def "bctl disconnect" [
        device_id?:string, #bluetooth device mac
] {
    let connected_devices = bluetoothctl devices Connected | parse "Device {id} {name}"
    if $device_id != null {
        bluetoothctl disconnect
    } else {

        if (($connected_devices | length ) > 1 ) {
            let device_id = select_device $connected_devices
            bluetoothctl disconnect $device_id
        } else {
            bluetoothctl disconnect
        }
    }
}

export def "bctl connect" [
    device_id?: string, # bluetooth device mac
] {
    let device_id = if $device_id == null {
        let devices = bluetoothctl devices | parse "Device {id} {name}"
        select_device $devices
    } else {
        $device_id
    }
    bluetoothctl connect $device_id
}
