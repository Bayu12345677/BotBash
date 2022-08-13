#!/data/data/com.termux/files/usr/bin/bash

# set variable
: ${app:=""}
: ${assigmnet:=""}

sys.parse()
{
	declare -g app="$1" # argument
	declare -g named="$3" # nama argument

	# buat syntax
	if (test "$2" != "~>"); then
		echo -e "[system] Error -> ${*} [${BASH_LINENO[0]}:${BASH_SOURCE[1]}]"
		exit 22
	fi

	# bangun structure kode nya
	set_code_conf="${named}=\"${app}\""
}

sys.argv()
{
	local named=${@:3}
	local named=${named/[/}
	local named=${named/]/}
	sys.parse "$1" "$2" "$named"
	eval "$set_code_conf"
}


shopt -s expand_aliases
alias options.args:="sys.argv"
