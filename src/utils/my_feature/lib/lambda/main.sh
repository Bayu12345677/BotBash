#!/usr/bin/env bash

# depencies
@import text_display/colorama

system.function()
{
	__namefunc__="$1"
    __funct__="${@:3}"
	__funct__="${__funct__/[/}"
	__funct__="${__funct__/]/}"

	#eval "${__namefunc__}(){ eval \"\$__func__\"; }"
	if (test "$2" != "="); then
		echo "None"; exit 22
	fi

	if ! (echo "$__funct__"|grep -o "lambda:" &> /dev/null); then
		echo "Failed: ${BASH_LINENO[1]} -> ${__funct__}"
		exit 32
	else
		eval "\$__funct__"
	fi

	eval "${__namefunc__:-null}=\"Object: [\${__funct__}]\""
}

lambda:()
{
	__func__="${@:3}"

	if (test "$1" != "command"); then
		echo "None: ${BASH_LINENO[1]} -> ${1}"
	elif (test "$2" != ":"); then
		echo "None: ${BASH_LINENO[1]} -> ${2}"
	fi

	eval "${__namefunc__:-null}(){ eval \"${__func__}\"; }"
	#alias ${__namefunc__:-null}="${__func__}"
}

shopt -s expand_aliases
alias var::lambda="system.function"
