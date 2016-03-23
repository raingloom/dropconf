#!/bin/zsh
pkglist=("highlightselected" "moveline" "openimagefile" "moonscript")
pkgdir="$HOME/.zbstudio/packages/"

mkdir -pv $pkgdir
cd $pkgdir
for pkg in $pkglist; do
	echo $pkg
	ln -srv "$HOME/dropconf/ZeroBranePackage/$pkg".lua ./ || echo "link already exists"
done
echo done
