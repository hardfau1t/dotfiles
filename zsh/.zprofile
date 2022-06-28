export ZLOCALDIR=~/.local/share/zsh
export ZDOTDIR=~/.config/zsh
source $ZDOTDIR/zsh-exports
source "$CARGO_HOME/env"
# if rustup is present then only set rust tools
# TODO: use RUSTUP_HOME only if its set otherwise use $HOME/.rustup
which rustup >/dev/null && export PATH="$RUSTUP_HOME/toolchains/`rustup default | grep -o "^\S*"`/bin":$PATH
export PATH=~/.local/bin:$PATH

