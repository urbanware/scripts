
alias batt-info='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|to\ empty|percentage"'
alias ll='ls -laG'

PROMPT_DIRTRIM=2
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

# Git branch in prompt.

## green up to hostname, then blue, then plain for git branch
COLOURGREEN="\033[01;32m"
COLOURBLUE="\033[01;34m"
COLOURPLAIN="\033[m"
COLOURRED="\033[1;31m"
COLOURYELLOW="\033[1;33m"
COLOURBLUE_GREEN_BK="\033[34;102m"
COLOURBLUE_YELLOW_BK="\033[34;103m"
COLOURBLUE_RED_BK="\033[34;101m"
#COLOROCHRE="\033[38;5;95m"
COLOUROCHRE="\033[0;95m"
#COLORWHITE="\033[0;37m"
#COLORWHITE="\033[0;37m"


parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git_colour() {
	#local gitstatus="$(git status 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
	
	local gitstatus="$(git status --porcelain 2> /dev/null)"

	# if [[ ! $gitstatus =~ "working directory clean" ]]; then
	# 	echo -e $COLOURRED
	# elif [[ $gitstatus =~ "Untracked files:" ]]; then
	# 	echo -e $COLOURYELLOW
	if [[ $gitstatus =~ "??" ]]; then
		echo -e $COLOURBLUE_RED_BK	
	elif [[ $gitstatus =~ "A" ]]; then
		echo -e $COLOURBLUE_YELLOW_BK
	else
		echo -e $COLOURBLUE_GREEN_BK
	fi
}

# git_colour() {
# 	#local gitstatus="$(git status 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
# 	local gitstatus="$(git status 2> /dev/null)"

# 	if [[ ! $gitstatus =~ "working directory clean" ]]; then
# 		echo -e $COLOURRED
# 	elif [[ $gitstatus =~ "Changes to be committed" ]]; then
# 		echo -e $COLOURYELLOW
# 	elif [[ $gitstatus =~ "nothing to commit" ]]; then
# 		echo -e $COLOURGREEN
# 	else
# 		echo -e $COLOURPLAIN
# fi
# }

#zig@zig-laptop ~/.../jcsa/jcsaredux (origin/master)
#export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[m\]\$(parse_git_branch) $ "

export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\$(git_colour)\]\$(parse_git_branch)\[\033[m\] $ "
#
#PS1="\[$COLOURGREEN\]\[\u@\h\]\[$COLOURBLUE\]\[\$(git_colour)\$(parse_git_branch)\] $ "
#export PS1



### PATHS
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
