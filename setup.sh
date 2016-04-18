dropconf="$HOME/dropconf"

# using ls -A instead of changing globbing settings through shopt
for f in $(ls -Ax "$dropconf/home"); do
	f="$dropconf/home/$f"
	mkdir -p "$(dirname $f)"
	echo $f
	ln -v -s -i -t $HOME $f
done
