# Configuration for Bourne-compatible shells
# by: Rain Gloom
# license: do whatever you want with it, just don't come crying or send lawyers when something breaks



#==Parameters==
# editor preferences
pref_visual=( nvim vim nano emacs )
# custom xclip function use this
export clipname=primary
#==//////////==



if [ -d $HOME/bin ]; then
	export PATH="$HOME/bin:$PATH"
fi
if [ -d /opt/openresty ]; then
	export PATH="/opt/openresty/bin:/opt/openresty/nginx/sbin:$PATH"
fi

alias ls='ls --color=auto'
alias rmr='rm -rvf'
alias l=ls
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'


# find an editor that exists
for v in $pref_visual; do
	if which "$v" > /dev/null; then
    	export VISUAL="$v"
	    break
	fi
done


#==Custom functions==
# xclip copy-pasting
xclipSelections=(
	primary
	secondary
	clipboard
)
clipx(){
	xclip -selection $clipname
}
# same as clipx, but floods all copy buffers from the default one
clipxflood(){
	xclip
	for sel in $xclipSelections; do
		xclip -o | xclip -selection $sel
	done
}
pastex(){
	xclip -o -selection $clipname
}
# symlink magix
lnmv (){
	mkdir -p $2
	mv -v -t "$2" "$1"
	ln -vs "$2/$(basename $1)" "$(dirname $1)"
}
mkcd (){
	mkdir -p $1
	cd $1
}
# luaenv needs manual activation
activate-luaenv(){
	if [ -d "$HOME/.luaenv" ]; then
		export PATH="$HOME/.luaenv/bin:$PATH"
		eval "$(luaenv init -)"
	fi
}
#==////////////////==



# Welcome text
welcome="Hello $(whoami), welcome to $(hostname)"
if which figlet > /dev/null; then
	echo $welcome | figlet -t -f kban
else
	echo $welcome
fi

# Fuck. That. Fucking. Goddamn. Fucktard. Bell.
xset -b
# Fuck.

#EOF
