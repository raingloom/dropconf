# Configuration for Bourne-compatible shells
# by: Rain Gloom
# license: do whatever you want with it, just don't come crying or send lawyers when something breaks



#==Parameters==
# editor preferences
pref_visual=( nvim vim nano emacs )
# custom xclip function use this
export clipname=primary
#==//////////==




export PATH="$HOME/bin:$PATH"


alias ls='ls --color=auto'
alias rmr='rm -rvf'
alias l=ls
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'


for v in $pref_visual; do
	if which "$v" > /dev/null; then
    		export VISUAL="$v"
	        break
	fi
done


#==Custom functions==
# xclip copy-pasting
clipx(){
	xclip -selection $clipname
}
pastex(){
	xclip -o -selection $clipname
}
# symlink magix
removelink() {
  [ -L "$1" ] && cp --remove-destination "$(readlink "$1")" "$1"
}
lnmv () {
	mv -v -t "$2" "$1"
	ln -vs "$2/$(basename $1)" "$(dirname $1)"
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
#EOF
