set -o vi
alias cat=bat
alias v=/usr/bin/nvim
alias fm=vifm
alias gdb='gdb -q'
alias arm-none-eabi-gdb='arm-none-eabi-gdb -q'
alias sway="sway > /var/log/sway.log 2>&1"
alias se=sudoedit
alias ls='ls --color'

eval "$(starship init bash)"
