#!/data/data/com.termux/files/usr/bin/bash

def: minimist.argv()
{
	var value::variabel = "${@/[/}"
	var value::variabel = "${value__variabel/]/}"

	var value::set1 = "${value__variabel/[a-z][^>]=/}"
	var value::set2 = "${value__variabel%=*}"
#	echo "${value__set2}${value__set1}"
	eval "$(@return: [value::set2])=\"$(@return: [value::set1])\"" || { e="Error into ${@}"; }
}
