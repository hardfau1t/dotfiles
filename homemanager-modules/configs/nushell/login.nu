use std
if $env.CARGO_HOME? != null {
  std path add $env.CARGO_HOME
}

$env.LD_LIBRARY_PATH  = (
    [
        ($env | get -o LD_LIBRARY_PATH),
        (if (which rustup | length) >= 1 and (do -i {rustup default}| complete).exit_code == 0 {
            $"($env.RUSTUP_HOME)/toolchains/(rustup default | grep -o -e '^\S\+')"
        }),
        "/usr/local/lib",

    ]
    | where {|it| $it != null } 
    | str join ':' 
)

if (tty) == "/dev/tty1" {
    do -i {
        uwsm check may-start
        uwsm select
        exec systemd-cat -t uwsm_start uwsm start default
    }
}
