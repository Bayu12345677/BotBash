#!/data/data/com.termux/files/usr/bin/bash


# susah jelasin nya mending main epep
name_app=""
# yntkts
sys.captureArray()
{
	# variable local tidak bisa di akses jika executor nya berada si luar fungsi
	local name_app="$1"
	local value_app="${@:3}"

	if (test "$2" != "=>"); then
		echo -e "[system] Error -> $@ INTO ($2); [${BASH_LINENO[0]}:${BASH_SOURCE[1]}]"
		exit 23
	fi

	# regex substitution
#	regex_sb1=$(echo "$value_app"|sed $'s;\[;\";g')
#	regex_sb2=$(
#		echo "$regex_sb1"|sed $'s;\];\";g'
#	)
	regex_sb2="${value_app/,/ }"
	set_upgrade_componen="$name_app=${regex_sb2}"
	#echo "$set_upgrade_componen"
	#exit
}

# testing
# sys.captureArray alok \=\> \([halo world],[aowwkkwk lol]\) => hasil : True

sys.ExeCutions()
{
	sys.captureArray $@
	eval "$set_upgrade_componen"
	unset set_upgrade_componen
}

sys.build()
{
	local app_syntax="${@%\)*}"
	local app_syntax="${app_syntax#\(*}"
	sys.ExeCutions ${app_syntax}
	#echo "${app_syntax}"
}

shopt -s expand_aliases
alias var:array="sys.build"

#var:array \(tes \=\> \("\\\e[32mhalo world","test aowkwk"\)\)
#echo -e "${tes[0]}"
# test = True
#sys.build \(\(name \=\> alok\)\)
