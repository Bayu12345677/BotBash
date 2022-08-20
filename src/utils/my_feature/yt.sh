#!/data/data/com.termux/files/usr/bin/bash

source lib/moduler.sh

@require bash.mod
@require csrf.s

# youtube mechanize
class __ytdl__;{
	{
		public: app = parse
		public: app = download
	}

	def: __ytdl__::parse()
	{
		{
			options.args: "$1" ~\> [url]
		}

		var req : $(bash <<< $({ cat << EOF
					curl --silent \
						 --location \
						 --request GET \
						 --header "user-agent: Mozilla/5.0 (Linux; Android 9; TA-1021) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36" \
						 --url "$url" \
						 --insecure --compressed
EOF
			}| sed 's;null;'';g')
		)

		var info : $(bash <<< $({ cat << __EOF__
				curl --silent \
					 --location \
					 --request POST \
					 --header "accept: application/x-www-form-urlencoded; charset=UTF-8" \
					 --header "Mozilla/5.0 (Linux; Android 9; TA-1021) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36" \
					 --data-raw "u=${url}&c=ID" \
					 --url 'https://154.82.111.113.sslip.io/newp' \
					 --insecure --compressed
__EOF__
			})
		)
		
		var base : $(echo "$req"|grep -Po '(?<=ytInitialPlayerResponse\s=\s)(.*?)(?=;(?:var\smeta|<\/script>))'|sed 's;null;'';g')
		var get_format_video : $(echo "$base"|jq -r .streamingData.formats[0])
		var set_url : $(@return: get_format_video|jq -r .url)
		var set_id : $(@return: info|jq -r .data.id)
		var set_title : $(@return: info|jq -r .data.title)
		var set_durasi : $(@return: info|jq -r .data.duration)
		var set_jaga : $(@return: info|jq -r .data.mp4)
		#@return: req|grep -Po '(?<=ytInitialPlayerResponse\s=\s)(.*?)(?=;(?:var\smeta|<\/script>))'|jq -r .streamingData.formats
	}

	def: __ytdl__::download()
	{
		{
			# argument
			DEBUG << EOF
				- url=
				- out=
EOF

			argv.get_arg ["$1"]
			argv.get_arg ["$2"]
		}

		curl --parallel --parallel-max 500 -sL "$url" -o "${out}.mp4" --insecure
	}
}

const: __ytdl__ = ytdl

#ytdl.parse "https://youtube.com/shorts/BIiWmW9kVYA?feature=share
def: main()
{
	catimg -tcr 1000 png/al.png
	local set_up="
[bold][blue][[green]⧒[blue]][white] Author   [black]:[white] Bayu Rizky A.M
[bold][blue][[cyan]≫[blue]][white] Youtube  [black]:[white] Pejuang Kentang
           [bold][blue][[yellow]⌬[blue]][white] Features [black]:[white] Ytdl[yellow] ([red]Y[white]outube [magenta]D[white]own[green]l[white]oader[yellow])
	"; rich "$set_up" -Cp -a heavy -w 100
	echo
	Tulis.str "${ku}[${hi}yt${me}-${hi}url${ku}]${cy}≫ $st"; read input_user
	echo
	tput civis
	call: tput [sc]
	animasi.ball_routing "${ku}[${hi}⌬${ku}]" "${pu}Checking url"
	call: tput [rc]
	if ! (curl -sL "$input_user" -o /dev/null); then
		tput ed
		tput cnorm
		println_err "Koneksi anda buruk mohon periksa dan coba kembali"
		read -s; clear; main
	fi
	
	call: tput [ed]
	call: tput [cnorm]
	call: tput [sc]
	
	Tulis.str "${ij}[${hi}title${ij}]${me}-${ku}> ${st}"; read _title_

	call: tput [rc]
	call: tput [ed]
	call: tput [sc]

	Tulis.str "${ij}[${hi}mp3${me}/${hi}mp4${ij}]${cy}≫ ${st}"; read _type_

	call: tput [rc]
	call: tput [ed]
	call: tput [civis sc]
	echo
	
		animasi.small_big ICON="${me}[${ij}⧒${me}]" \
				TEXT="${pu}running" \
	
	tput rc
	
	call: ytdl.parse ["$input_user"]

	if (test -z "$_title_"); then
		This.var set::title = "${set_title}"
	else This.var set::title = "${_title_/.mp3/}"
	fi

	call: tput [cnorm ed]

	This.var set::duration = "$set_durasi"
	This.var set::type = "${_type_:-mp4}"

	if [[ "$set__type" =~ (mp3|MP3)$ ]]; then true
	elif [[ "$set__type" =~ (mp4|MP4)$ ]]; then true
	else This.var set::type = "mp4"; fi
	
	def: inf()
	{
		Tulis.strN \("${ij}[${me}≫${ij}]$pu Default Title$me  :$pu ${set_title}"\)
		Tulis.strN \("${ij}[${me}≫${ij}]$pu Duration $me      :$pu ${set__duration}"\)
		Tulis.strN \("${ij}[${me}≫${ij}]$pu Set title $me     :$pu ${set__title}"\)
		Tulis.strN \("${ij}[${me}≫${ij}]$pu Type      $me     :$pu ${set__type}${st}"\)
	}

	inf
	echo
	call: tput [sc]
	Tulis.str "${me}[${hi}y${ij}/${hi}n${me}]${ku}≫${st} "; read _dd_
	call: tput [rc ed civis]
	echo
	if (test "$_dd_" == "y"); then
		true
	else clear;main; fi
	
	#if (test "$set__type" == "mp4") || (test "$set__type" == "MP4"); then {
	def: dlo(){
		let rgb=0
		tput sc
		while true; do
			let rgb++

			if ((rgb == 1)); then
				This.var rgb::setup = "${ku}"
			elif ((rgb == 2)); then
				This.var rgb::setup = "${me}"
			elif ((rgb == 3)); then
				This.var rgb::setup = "${ij}"
			elif ((rgb == 4)); then
				This.var rgb::setup = "${cy}"
			elif ((rgb == 5)); then
				This.var rgb::setup = "${m}"
				let rgb=0
			fi
			tput sc	
			animasi.bar ICON="${cy}[${hi}⚙${cy}]" \
					TEXT="${pu}Downloading" \
					icon_progress="#" \
					count_progress=10 \
					icon_colors="$rgb__setup"
			tput rc
		tput ed	
		done &
		tput rc
		let sig_spek=$!

		ytdl.download url="https://ytpp3.com${set_jaga}" out="${set__title/.mp4/}"
		kill "$sig_spek" 2> /dev/null
	}

	if (test "$set__type" == "mp4") || (test "$set__type" == "MP4"); then {
		dlo
		echo
		tput sc
		for x in {1..5}; do
			animasi.wave_ball "${me}[${ij}?${me}]" "${pu}Checking Files"
		done
		tput rc
		tput ed cnorm
		echo
		Tulis.strN "${me}[${cy}⌬${me}]${pu} Save to${cy} /sdcard/Ytdl"
		Tulis.strN "${me}[${hi}⚙${me}]$pu Size ${ij}$(du -h \"${out}.mp4\")"
		This.var std::output = "${set__title/.mp4/}"
		mkdir /sdcard/Ytdl &> /dev/null
		tput cnorm
		if (mv "${std__output/.mp3/}.mp4" /sdcard/Ytdl &> /dev/null); then
			#println_info "Success"
			Tulis.strN "${ij}[${cy}⌬${ij}]$pu done save to ${hi}/sdcard/Ytdl"
			echo
			read -p "y / c = " te
			if (test "$te" == "y"); then
				clear; main
			else
				exit 0
			fi
		else
			println_info "Error"
			Tulis.strN "${ij}[${me}?${ij}]${pu} Error tidak teridentifikasi"
			read -s -N 1 lllll;clear; tput cnorm; main
		fi
		#Tulis.strN "Downloading ${set__title}.mp4"
	}

	elif (test "$set__type" == "mp3") || (test "$set__type" == "MP3"); then
		dlo
		echo
		tput sc
		for x in {1..5}; do
			animasi.wave_ball "${ku}[${me}⌬${ku}]" "${pu}Checking Files"
		done
		tput rc ed cnorm
		mkdir /sdcard/Ytdl &> /dev/null
		if (test -f "${out}.mp4"); then
			Tulis.strN "${ku}[${cy}≫${ku}]$pu Status File ${me}-${m}> ${ij}[${pu}Done${ij}]"
			Tulis.strN "${ku}[${cy}≫${ku}]$pu Converting to mp3${st}"
			sleep 1
			echo
			sleep 0.1
			ffmpeg -i "${out}.mp4" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${out}.mp3"
			echo
			if (test -f "${out}.mp3"); then
				Tulis.strN "${cy}[${hi}⚙${cy}]${pu} Success convert to ${cy}mp3"
				Tulis.strN "${cy}[${ku}⚙${cy}]${pu} File saved to ${ij}/sdcard/Ytdl"
				if (mv "${out}.mp3" /sdcard/Ytdl &> /dev/null); then
					Tulis.strN \("${me}[${ij}⧒${me}] ${pu}Status ${ku}-${m}>${ij} (${hi}True${ij})"\)
				else Tulis.strN \("${me}[${ku}⧒${me}] ${pu}Status ${ku}-${m}>${ij} (${hi}False${ij})$st"\);fi
			else Tulis.strN "${cy}[${hi}⚙${cy}]${pu} Failed Convert to mp3"
			     Tulis.strN "${cy}[${hi}⚙${cy}]${pu} Converting error";fi
		else Tulis.strN "${ij}[${me}?${ij}]${pu} Failed File not Found ${me}!${st}"; read -s -N 1 null; clear; tput cnorm; main; fi
			 echo
		rm -rf "${out}.mp4" &> /dev/null
			 read -p "y / n = " tet
			 if [[ "$tet" =~ (Y|y)$ ]]; then
			 	exit 0
			 else clear; tput cnorm; main; fi
			 
		fi
}

pg()
{
	kill "${sig_spek}" 2> /dev/null; tput cnorm; exit
}; trap "pg" INT SIGINT
main
