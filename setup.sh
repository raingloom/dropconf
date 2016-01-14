dropconf="$HOME/dropconf"

for f in $(ls -Ax $dropconf/home); do
	f="$dropconf/home/$f"
	echo $f
	ln -v -s -i -t $HOME $f
done
