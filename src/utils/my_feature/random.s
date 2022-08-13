#!/data/data/com.termux/files/usr/bin/bash

# plugins bash moderen
#source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/lib/moduler/.sh"
source lib/moduler.sh
# depencies
#Bash.import: text_display/colorama text_display/IO.ECHO
#Bash.import: lambda/main minimist/args
#Bash.import: util/operator
@require bash.mod
@require csrf.s

var get_file : "txt.csf"
var::lambda openCf = [lambda: command : cat \$@]

let set_head=1

# mechanize
class __botrandom__ && {
	{
		public: app = brain;
		public: app = random_reply;
	}

	def: __botrandom__::brain()
	{
		options.args: "$1" ~\> [set_ilmu]
		local my_set=$(call: openCf [${get_file}])
		let total_rp=$(call: openCf [${get_file}]|wc -l)
		let urandom_txt=($(shuf -i 1-${total_rp} -n 1) + $((total_rp - 1)))
		#echo "$urandom_txt"
		if ((urandom_txt > total_rp)); then set_up_public_config=$(@return: my_set|sort -R|head -${set_head})
		else set_up_public_config=$(@return: my_set|tail +${urandom_txt}|head -${set_head})
		fi

		var abb : $(@return: my_set|grep -o "$set_ilmu")
		if (test -z "$set_ilmu") || (test "$set_ilmu" == "$abb"); then true
		else echo "$set_ilmu" >> $get_file
		fi
	}

	def: __botrandom__::random_reply()
	{
		@return: set_up_public_config || Tulis.strN \("Null"\)
	}
}

const: __botrandom__ = botrandom
const: __minimist__ = argv

def: main()
{
	# Ai buar cek waktu
	var base : $(date +%_H:%M)
	var jam : $(@return: base|cut -d ':' -f1|cut -d " " -f 2)
	var menit : $(@return: base|cut -d ':' -f2)

	# 02 > 3 > 10 = pagi
	# 11 > 2 = siang
	# 3 > 5 = sore
	# 6  = senja
	# 7 > 11 = malam
	# 00 > 1 = tengah malam

	# yaps
	if ((jam == 2 || jam == 3 || jam == 5 || jam == 6 || jam == 7 || jam == 8 || jam == 9 || jam == 10)); then
			var Ai_date : "Selamat Pagi"
	elif ((jam == 11 || jam == 12 || jam == 13)); then
			var Ai_date : "Selamat Siang"
	elif ((jam == 15 || jam == 16 || jam == 17)); then
			var Ai_date : "Selamat Sore"
	elif ((jam == 18)); then
		var Ai_date : "Selamat Senja"
	elif ((jam == 19 || jam == 20 || jam == 21 || jam == 22 || jam == 23)); then
			var Ai_date : "Selamat Malam"
	elif ((jam == 00 || jam == 1)); then
			var Ai_date : "Tengah Malam"
	fi
	
	Tulis.strN "┈┈┈${ku}╲${st}┈┈┈┈${ku}╱${st}"
	Tulis.strN "┈┈┈${cy}╱▔▔▔▔╲${st}"
	Tulis.strN "┈┈${cy}┃${st}┈${me}▇${st}┈┈${me}▇${st}┈${cy}┃    ${ij}╔╗ ${hi}┌─┐${pu}┌┬┐ ${m} ╦═╗${hi}┌─┐${pu}┌─┐┬ ┬ ┬${me}|${ij}•$pu Author$me  :$pu Bayu Riski A.M${st}"
	Tulis.strN "${ku}╭╮${cy}┣${cy}━━━━━━┫${ku}╭╮  ${ij}╠╩╗${hi}│ │${pu} │  ${m} ╠╦╝${hi}├┤ ${pu}├─┘│ └┬┘${me}|${cy}•$pu github$me  :$pu Bayu12345677${st}"
	Tulis.strN "${ku}┃┃${cy}┃${st}┈┈┈┈┈┈${cy}┃${ku}┃┃  ${ij}╚═╝${hi}└─┘${pu} ┴  ${m} ╩╚═${hi}└─┘${pu}┴  ┴─┘┴ ${me}|${ku}•$pu Youtube$me :$pu Pejuang Kentang${st}"
	Tulis.strN "${ku}╰╯${cy}┃${st}┈┈┈┈┈┈${cy}┃${ku}╰╯  ${ku}〘 ${hi}⚙ ⚙${m} R${pu}andom ${ku}C${pu}hat${hi} ⚙ ⚙${ku} 〙${st}"
	Tulis.strN "┈┈${cy}╰┓┏━━┓┏╯"
	Tulis.strN "┈┈┈${cy}╰╯${st}┈┈${cy}╰╯${st}"
	Tulis.strN \("${cy}╭───────────────────────────────────────────────────────────"\)
	Tulis.strN \("${cy}├${ku}[${hi}⩺${ku}]${pu} Date Time ${me}:${ij} (${cy}${jam}${me}:${cy}${menit}${ij})$hi ${Ai_date}${st}"\)
	Tulis.strN \("${cy}├${ku}[${cy}⌬${ku}]${pu} Config    ${me}:${hi} ${get_file}"\)
	Tulis.strN \("${cy}├───────────────────────────────"\)
	Tulis.strN \("${cy}├${ku}[${hi}⚙${ku}]${pu} Uptime${me} :${pu} $(uptime)"\)
	Tulis.strN \("${cy}├${ku}[${bi}❏${ku}]${pu} Tgl ${me}   : ${hi}$(date +%y/%m/%d)"\)
	Tulis.strN \("${cy}├${ku}[${cy}➢${ku}]${pu} Type ${me}  : ${ij}R${pu}andom ${me}C${pu}hat"\)
	Tulis.strN \("${cy}╰───────────────────────────────────${st}"\)
	echo
	while { Tulis.str "${ku}[${hi}user${ku}] ${me}:${st} "; read input_chat; }; do
		if [[ "$input_chat" =~ (e|E)(xi|XI)[a-zA-Z%._-]*|(K|k)(el|EL)[a-zA-Z%._-]*$ ]]; then
			break
		fi
		botrandom.brain "${input_chat}"
		var render_reply : $(botrandom.random_reply)
		call: tput [sc]
		call: tput [civis]
		animasi.spinner1 "${ij}[${hi}⚙${ij}]" "${pu}Loading"
		call: tput [rc]
		call: tput [ed] && call: tput [cnorm]
		Tulis.strN \("${ku}[${hi}bot${ku}]  ${me}:${pu} ${render_reply}"\)
	done
}

#animasi.bar ICON="•" TEXT="testing" icon_progress="#" count_progress=19
def: pg()
{
	tput ed; tput cnorm sgr0; exit
}

main
