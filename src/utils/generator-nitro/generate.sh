#!/data/data/com.termux/files/usr/bin/bash

# terserah penting lu udah subscribe channel pejuang kentang

source lib/moduler.sh

Namespace Std :: Sys;

Bash.import: Shua/Ua
Bash.import: colorsh/ink
Bash.import: feature/io.echo

var hi = $(mode.normal: hitam)
var ij = $(mode.bold: hijau)
var me = $(mode.bold: merah)
var bi = $(mode.bold: biru)
var cy = $(mode.bold: cyan)
var m = $(mode.bold: pink)
var pu = $(mode.bold: putih)
var ku = $(mode.bold: kuning)
var st = $(default.color)

const: __SHUA__ =\> Userag
# --------- RANDOM GENERATOR LINK DISCORD ----------- #

class __link__;{
	{
		public: app =\> [generate];
		public: app =\> [build];
	}

	public __link__::generate()
	{		# ------------------- max karakter 20 - 16 ------------------- #
		alias string='cat /dev/urandom|head -1|tr -dc "a-zA-Z0-9"|fold -w $(shuf -i 16-20 -n 1)'
		var string::rows = $(string)
		while true; do
		#var string::rows = $(string.random)
		#@return: [string::rows]
			#echo "$string__rows"
			for str_random in $(echo $(@return: [string::rows])); do
				#@return: [string::rows]
				let value_row=$(say.echo "${#str_random}")
			if ((value_row == 16 || value_row == 17 || value_row == 18 || value_row == 19 || value_row == 20)); then
				var set::status = "True"
				var set::valid = "${str_random}"
				break
			elif (test -z "$str_random"); then
				var string::rows = $(string)
				var set::status = "False"
			else var string::rows = $(string);var set::status = "False";fi
			done
			if (test "${set__status}" == "True"); then break
			else var string::rows = $(string);fi
		done

		@return: [set::valid]
	}

	def: __link__::build()
	{
		var string::random = $(__link__::generate)

		say.echo "https://discord.gift/$(@return: [string::random])"
	}
}


const: __link__ =\> link

def: main()
{
	toilet -f slant -F metal "Generator Nitro"
	say.echo "${cy}╭────────────${ij}(${me} ⩺${m} I${pu}nfo ${m}S${pu}cript ${ij})"
	say.echo "${cy}╿"
	say.echo "${cy}├${me}≫ ${ku}[${me}⚙${ku}]$pu Author ${me}:${pu} Bayu Rizky A.M"
	say.echo "${cy}├${me}≫ ${ku}[${me}⚙${ku}]$pu github ${me}:${hi} https://github.com/Bayu12345677"
	say.echo "${cy}├${me}≫ ${ku}[${me}⚙${ku}]$pu Youtue ${me}:${ij} P${pu}ejuang ${m}K${pu}entang"
	say.echo "${cy}├───────────────────────────────────"
	say.echo "${cy}├${me}≫ ${ku}[${cy}⌬${ku}]${pu} Datetime ${me}:${cy} $(date +%H)${me}:${ij}$(date +%M)"
	say.echo "${cy}├${me}≫ ${ku}[${me}⌬${ku}]${pu} Day      ${me}:${pu} $(date +%A)"
	say.echo "${cy}╰─────────────────────────────────────"
    say.echo "${bi}╭───────────────${ku}[ ${me}• ${ij}•${hi} menu ${ij}• ${me}• ${ku}]${bi}───────────────╮"
    say.echo "${bi}├${me}⩺$hi 1${me}.$pu method Auto Proxy ${m}(${me}selow${m})$bi                ╿"
    say.echo "${bi}├${me}⩺$hi 2${me}.$pu method custom proxy ${m}(${ku}medium${m})$bi             ╿"
    say.echo "${bi}├${me}⩺$hi 3${me}.$pu method Airplane Mode ${m}(${ij}fast${m})$bi              ╿"
    say.echo "${bi}├${me}⩺$hi 4${me}.$pu Open Result ${m}(${ij}open${m})$bi                       ╿"
    say.echo "${bi}├${me}⩺$hi 5${me}.$pu Exit ${m}(${cy}feature${m})$bi                           ╿"
    say.echo "${bi}╰──────────────────────────────────────────────╯\n"

    io.write "${ku}[${cy}⌬${hi} menu ${cy}⌬${ku}]${me}⩺$st "; read input
	echo
	if (test "$input" == "1"); then {
		if ! (test -f "proxy.d"); then
		say.echo "[-] grab random proxy"
		local proxy=$(bash <<< $({ cat << __EOF__
						curl --silent \
							 --location \
							 --request GET \
							 --url "https://api.proxyscrape.com/?request=displayproxies&proxytype=http&timeout=2150&ssl=yes" \
							 --insecure
__EOF__
					})
		)

		say.echo "[+] Checker Proxies"
		for list_proxy in ${proxy}; do
			var urandom::Ua = $(Userag.random)
			var status::code = $(curl -A "$(@return: [urandom::Ua])" --connect-timeout 3 --max-time 4 -Y 600 -y 1 -f --parallel --parallel-max 500 -sL --proxy "${list_proxy}" --url "google.com" --insecure -o /dev/null -w %{http_code})
			if (($(@return: [status::code]) == 000)); then
				say.echo "${cy}[${me}-${cy}]$pu Failed Connecting$hi ${list_proxy}${st}"
			else
				say.echo "${cy}[${ij}+${cy}]$pu Success Connecting$hi ${list_proxy}"
				say.echo "${list_proxy}" >> proxy.d
			fi
		done
		echo
		say.echo "${cy}[${ku}?${cy}]${pu} Checker ${hi}proxy.list"; echo
		for list_proxy in $(cat proxy.list); do
			var urandom::ua = $(Userag.random)
			var status::code = $(curl -A "$(@return: [urandom::ua])" --connect-timeout 1 --max-time 2 -Y 600 -y 1 --parallel --parallel-max 600 -sL --proxy "${list_proxy}" --url "google.com" --insecure -o /dev/null -w %{http_code})
			if (($(@return: [status::code]) == 000)); then
				say.echo "${cy}[${me}-${cy}]${pu} Failed Connection${hi} ${list_proxy}$st"
			else say.echo "${cy}[${ij}+${cy}]${pu} Success Connection${hi} ${list_proxy}$st"; say.echo "${list_proxy}" >> proxy.d; fi
		done
		else true; fi
		echo
		say.echo "${cy}[${ku}?${cy}]${pu} Starting generator"
		echo

		let switch=0
		
		while true; do
			var set::proxy::switch = $(cat proxy.d|tail +${switch}|head -1)
			var random::code = $(link.generate)
			var random::user = $(Userag.random)
			local get_status=$(bash <<< $({ cat << EOF
						curl --silent \
							 --location	\
							 --proxy "$(@return: [set::proxy::switch])" \
							 --connect-timeout 5 \
							 --max-time 6 \
							 --request GET \
						 -A "$(@return: [random::user])" \
							 --url "https://discordapp.com/api/v6/entitlements/gift-codes/$(@return: [random::code])" \
							 --parallel --parallel-max 600 \
							 --insecure --compressed --ssl -Y 600 -y 1 \
							 -o /dev/null -w %{http_code}
EOF
			})
		)
		#echo "$switch"

		if ((get_status == 200)); then {
			say.echo "${cy}[${ij}+${cy}]$pu Working code${ij} $(@return: [random::code]) ${ku}|$pu Status Code$hi $(@return: [get_status])$ku |$pu Proxy$hi ${list_proxy}"
			say.echo "https://discord.gift/$(@return: [random::code])" >> result.d
		}; elif ((get_status == 404)); then {
			say.echo "${cy}[${ku}-${cy}]$pu Failed Code$me $(@return: [random::code])$ku |$pu Status Code$hi $(@return: [get_status])$ku |$pu Proxy$hi ${list_proxy}"
		}; elif ((get_status == 429)); then {
			say.echo "${cy}[${me}-${cy}]$pu Proxy is Ratelimit$ku |$pu switching Proxy$hi $(@return: [set::proxy::switch])$ku |$pu Status Code$hi $(@return: [get_status])"
			let switch++
		}; else {
			say.echo "${cy}[${me}-${cy}]${pu} Proxy is Ratelimit${ku} |${pu} Status Code${hi} $(@return: [get_status])${ku} |${pu} Proxy${hi} ${list_proxy}"
			let switch++
		}; fi
			export code_status="${get_status}"
			if ((switch == $(cat proxy.d|wc -l))); then {
				say.echo "${cy}[${me}-${cy}]${pu} Process Finished"
				say.echo "${cy}[${me}-${cy}]${pu} Proxy over switch"
				exit $?
			}; fi
			
		#} catch {
		#	say.echo "[-] Invalid Error | Status Code ${get_status}"
		#}; done
		done
	}; elif (test "$input" == "2"); then {
		tput sc
		io.write "${cy}[${ij}>${me}>${ij}]${pu} Your Config${me} :$st "; read piles
		tput rc
		tput ed ed sgr0
		say.echo "${cy}[${ij}+${cy}]${pu} Open Config Proxy${hi} ${piles}"
		echo
		
			if cat ${piles} &> /dev/null; then {
			say.echo "${cy}[${ku}+${cy}]${pu} Starting Generator Random Nitro"
			echo
			let switch=1

			while true; do {
				var string::random = $(link.generate)
				var urandom::Ua = $(Userag.random)
				proxy__list=$(cat ${piles}|tail +${switch}|head -1)
				var get::status = $(bash <<< $({ cat << __EOF__
									curl --silent \
										 --location \
										 --proxy "$(@return: [proxy::list])" \
										 -Y 500 \
										 -y 1 \
										 --parallel \
										 --parallel-max 500 \
										 --connect-timeout 3 \
										 --max-time 4 \
										 -A "$(@return: [urandom::Ua])" \
										 --request GET \
										 --url "https://discordapp.com/api/v6/entitlements/gift-codes/$(@return: [string::random])" --insecure \
										 --compressed -o /dev/null -w %{http_code}
__EOF__
						})
				)

				if (($(@return: [get::status]) == 200)); then {
					say.echo "${cy}[${ku}+${cy}]${pu} Working Code${hi} $(@return: [string::random])${ku} |${pu} Status Code${hi} $(@return: [get::status])${ku} |${pu} Proxy ${hi}$(@return: [proxy::list])"
					say.echo "https://discord.gift/$(@return: [string::random])" >> result.d
				}; elif (($(@return: [get::status]) == 404)); then {
					say.echo "${cy}[${me}-${cy}]${pu} Failed Code ${hi}$(@return: [string::random])${ku} | ${pu}Status Code ${hi}$(@return: [get::status]) ${ku}|${pu} Proxy ${hi}$(@return: [proxy::list])"
				}; elif (($(@return: [get::status]) == 429)); then {
					say.echo "${cy}[${ku}?${cy}]${pu} Proxy is Ratelimit${ku} |${pu} Status Code${hi} $(@return: [get::status])${ku} |${pu} Proxy${hi} $(@return: [proxy::list])"
					let switch++
				}; else {
					say.echo "${cy}[${me}?${ku}]${pu} Invalid Error${ku} |${pu} Proxy Not valid ${ku}|${pu} proxy${hi} $(@return: [proxy::list])"
					let switch++
				}; fi

				if ((switch == $(cat ${piles}|wc -l))); then
					say.echo "${cy}[${me}-${cy}]$pu Process Finished"
					say.echo "${cy}[${me}-${cy}]$pu Proxy Over Switch"
					exit \$?
				fi
			}; done
		}; else {
			say.echo "${cy}[${ku}?${cy}]${pu} Failed Open Config Proxy"
			say.echo "${cy}[${ku}?${cy}]${pu} File Not found"
			echo
			read -p "Continue : " m; clear; main
		}; fi
	}; elif (test "${input}" == "3"); then {
		say.echo "${cy}[${ku}+${cy}]${pu} Starting Generator Nitro"
		echo
		while true; do {
			var urandom::user = $(Userag.random)
			var urandom::code = $(link.generate)
			var get::status = $(bash <<< $({ cat << __EOF__ 
									curl --silent \
										 --location \
										 -A "$(@return: [urandom::user])" \
										 -Y 500 \
										 -y 1 \
										 --parallel \
										 --connect-timeout 3 \
										 --max-time 4 \
										 --parallel-max 500 \
										 --request GET \
										 --url "https://discordapp.com/api/v6/entitlements/gift-codes/$(@return: [urandom::code])" \
										 --insecure --compressed -o /dev/null -w %{http_code}
__EOF__
				})
			)

			if (($(@return: [get::status]) == 200)); then {
				say.echo "${cy}[${ij}+${cy}]${pu} Working Code${hi} $(@return: [urandom::code])"
				say.echo "https://discord.gift/$(@return: [urandom::code])" >> result.d
			}; elif (($(@return: [get::status]) == 404)); then {
				say.echo "${cy}[${me}-${cy}]${pu} Failed Code${hi} $(@return: [urandom::code])"
			}; elif (($(@return: [get::status]) == 429)); then {
				tput sc
				io.write "${cy}[${me}!${cy}]${ij} on${me} off${pu} kan$m mode${hi} pesawat ${ij}-${me}> ${ku}[${hi}enter${ku}]$st"; read -s -N 1
				tput rc
				tput ed ed sgr0
			}; fi
		}; done
	}; elif (test "$input" == "4"); then {
		if ! (test -f "result.d"); then {
			{
				cat << __EOF__
		• Caution

		Debug : cat result.d => False
		Message : Files result.d Not found
		except: Press q to exit
__EOF__
			} | less && { clear; main; }
		}; else {
			bat result.d
		}; fi
	}; elif (test "$input" == "5"); then {
		say.echo "${cy}[${ku}!${cy}]$pu Shutdown tools$st"
		sleep 2
		exit 0
	}; else {
		clear; main
	}; fi
}

{ clear; } && { main; }
