for file in "$(dirname "$BASH_SOURCE")"/.bash/{envars,shell,aliases,commands,prompt,extra}; do
	[ -r "$file" ] && source "$file";
done;
unset file;
