# PATH declarations
export PATH="/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH="$PATH:/usr/local/smlnj/bin"
###/usr/local/lib/ruby/gems/2.2.0/bin:
export PATH="/Users/Walter/anaconda3/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/Walter/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ll='ls -lahG'
#alias ls='ls -GFh'

###[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

###source ~/.profile

# run every time we open a new window
eval "$(rbenv init -)"

# added by Anaconda3 4.2.0 installer
#export PATH="/Users/Walter/anaconda3/bin:$PATH"

# edit prompt
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ "

PROMPT_DIRTRIM=2
# export LS_OPTIONS='--color=auto'
# eval "$(dircolors -b)"
# alias ls='ls $LS_OPTIONS'

# Colour variables
COLOURGREEN="\033[01;32m"
COLOURBLUE_GREEN_BK="\033[34;102m"
COLOURBLUE="\033[01;34m"
COLOURBLUE_YELLOW_BK="\033[34;103m"
COLOURPLAIN="\033[m"
COLOURRED="\033[01;31m"
COLOURBLUE_RED_BK="\033[34;101m"
#COLOURYELLOW="\033[1;33m"
COLOURYELLOW="\e[48;5;215m"
#COLOROCHRE="\033[38;5;95m"
#COLOUROCHRE="\033[0;95m"
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

#export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\$(git_colour)\]\$(parse_git_branch)\[\033[m\] $ "

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[01;32m\]\h\[\033[01;34m\] \W\[\$(git_colour)\]\$(parse_git_branch)\[\033[m\] $ "

export PS1="\W\[\$(git_colour)\]\$(parse_git_branch)\[\033[m\] $ "

#export PS1="\W\[\$(git_colour)\]$(parse_git_branch)\[\033[m\] $ "
