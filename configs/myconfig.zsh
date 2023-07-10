
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/amir/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(oh-my-posh init zsh)"

# eval "/home/linuxbrew/.linuxbrew/bin"

func getWeather(){
        if [ -z "$1" ]; then
                location='london'
        else
                location="$1"
        fi
        curl -L wttr.in/"$location"
}


func Load_MyConfig(){
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
	alias cp="cp -i"                          # confirm before overwriting something
	alias df='df -h'                          # human-readable sizes
	alias free='free -m'                      # show sizes in MB
	alias cache='echo 3 | sudo tee /proc/sys/vm/drop_caches'
	alias np='nano -w PKGBUILD'
	alias more=less
	alias h='history'
	alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

	# ls, the common ones I use a lot shortened for rapid fire usage
 #	alias ls='ls --color=auto'
	alias l='ls -lFh'     #size,show type,human readable
	alias la='ls -lAFh'   #long list,show almost all,show type,human readable
	alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
	alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
	alias ll='ls -l'      #long list
	alias ldot='ls -ld .*'
	alias lS='ls -1FSsh'
	alias lart='ls -1Fcart'
	alias lrt='ls -1Fcrt'
	alias treed='tree / -L 1 -d'	# Tree File and Folders
	alias treef='tree / -L 1'		# Tree Files
	alias tree='tree -L 1'			# Tree Current Dir
	alias cls='clear'
	alias gpt='sgpt'
	alias help='sgpt'
	alias women='tldr'
	alias gitlog='git log --pretty=oneline --abbrev-commit'
#  	alias cheat='cht.sh'
# 	alias cht='cht.sh'
	alias myip='curl ifconfig.me'
# 	alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
	alias fast='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
	alias fast.com='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
	alias cd..='cd ..'
	alias wt='getWeather'
	alias wea='getWeather'
	alias weather='getWeather'
	alias todo='todo.sh'
}
Load_MyConfig


# Thefuck Tools
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias fuck)
eval $(thefuck --alias fix)

# Shell-GPT integration ZSH v0.1
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd")
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.1
