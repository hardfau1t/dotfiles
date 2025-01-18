export ZLOCALDIR=~/.local/share/zsh
export ZDOTDIR=~/.config/zsh
source $ZDOTDIR/zsh-exports
source "$CARGO_HOME/env"
# if rustup is present then only set rust tools
export PATH=~/.local/bin:$PATH

if which rustup > /dev/null
then
    test -n "$RUSTUP_HOME" && RUSTUP_DEFAULT=$RUSTUP_HOME/toolchains/$(rustup default | grep -o -e "^\S\+") || RUSTUP_DEFAULT=${HOME}/.rustup/toolchains/$(rustup default | grep -o -e "^\S\+")
    export PATH=$PATH:$RUSTUP_DEFAULT/bin
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$RUSTUP_DEFAULT/lib
fi
