export VISUAL=vim
export clipname=clipboard

activate-luaenv(){
	if [ -d "$HOME/.luaenv" ]; then
		export PATH="$HOME/.luaenv/bin:$PATH"
		eval "$(luaenv init -)"
	fi
}

export PATH="$HOME/bin:$PATH"

alias ls='ls --color=auto'
alias rmr='rm -rvf'
alias l=ls
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

#xclip copy-pasting
clipx(){
	xclip -selection $clipname
}
pastex(){
	xclip -o -selection $clipname
}

echo "Hello $(whoami), welcome to $(hostname)" | figlet -t -f kban
removelink() {
  [ -L "$1" ] && cp --remove-destination "$(readlink "$1")" "$1"
}
