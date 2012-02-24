for file in ~/.bash/{shell,aliases,commands,prompt,extra}; do
	[ -r "$file" ] && source "$file";
done;
unset file;
