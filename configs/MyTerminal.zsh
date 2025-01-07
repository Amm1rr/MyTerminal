#!/usr/bin/env zsh

# Weather function
getWeather() {
    local location=${1:-london}
    curl -L "wttr.in/$location"
}

# Load custom configurations
Load_alias_util() {
    # Color and interactive aliases
    alias grep='grep --colour=auto'
    alias egrep='egrep --colour=auto'
    alias fgrep='fgrep --colour=auto'
    alias cp="cp -i"                          # Confirm before overwriting
    alias df='df -h'                          # Human-readable sizes
    alias free='free -m'                      # Show sizes in MB

    # System aliases
    alias cache='echo 3 | sudo tee /proc/sys/vm/drop_caches'
    alias np='nano -w PKGBUILD'
    alias more=less
    alias h='history'
    alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to .zshrc

    # ls aliases
    alias l='ls -lFh'     # Size, show type, human readable
    alias la='ls -lAFh'   # Long list, show almost all, show type, human readable
    alias lr='ls -tRFh'   # Sorted by date, recursive, show type, human readable
    alias lt='ls -ltFh'   # Long list, sorted by date, show type, human readable
    alias ll='ls -l'      # Long list
    alias ldot='ls -ld .*'
    alias lS='ls -1FSsh'
    alias lart='ls -1Fcart'
    alias lrt='ls -1Fcrt'

    # Tree aliases
    alias treed='tree / -L 1 -d'  # Tree File and Folders
    alias treef='tree / -L 1'     # Tree Files
    alias tree='tree -L 1'        # Tree Current Dir

    # Utility aliases
    alias cls='clear'
    alias women='tldr'
    alias gitlog='git log --pretty=oneline --abbrev-commit'
    alias myip='curl ifconfig.me'
    alias fast='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
    alias fast.com='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
    alias cd..='cd ..'
    alias wt='getWeather'
    alias wea='getWeather'
    alias weather='getWeather'
}

# Load custom configurations
Load_alias_util

# TheFuck tool aliases
eval $(thefuck --alias)
eval $(thefuck --alias fuck)
eval $(thefuck --alias fix)
