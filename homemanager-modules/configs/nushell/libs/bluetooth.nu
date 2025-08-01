use std log
export def "bctl disconnect" [] {
    bluetoothctl disconnect
}

export def "bctl connect" [
    device_id?: string, # bluetooth device mac
] {
    let device_id = if $device_id == null {
        let devices = bluetoothctl devices | parse "Device {id} {name}"
        let index = $devices.name | input list --index --fuzzy "Select device"
        if $index == null {
            log warning "Nothing is selected. Not connecting"
            return
        }
        $devices.id | get $index
    } else {
        $device_id
    }
    bluetoothctl connect $device_id
}
