#!/data/data/com.termux/files/usr/bin/bash

# depencies
Bash.import: text_display/colorama text_display/IO.ECHO
Bash.import: minimist/args lambda/main util/operator
Bash.import: curl/main util/tryCatch

# warna
var hi : $(mode.normal: hitam)
var me : $(mode.bold: merah)
var ij : $(mode.bold: hijau)
var ku : $(mode.bold: kuning)
var m : $(mode.bold: pink)
var pu : $(mode.bold: putih)
var cy : $(mode.bold: cyan)
var bi : $(mode.bold: biru)
var st : $(default.color)

# deklarasikan object
const: __curlopt__ = opt
const: __minimist__ = argv
var nama_con : "$RANDOM$RANDOM.txt"
class __req__
{
	public: app = headers
	public: app = Curlexec

	def: __req__::headers()
	{
		#trap "rm -rf $__head__; exit" INT SIGINT EXIT
		local header=${@/[/}
		local header=${header/]/}
		local __head__="$nama_con"
		echo -e "$header" >> $__head__
		local __cek__=$(cat $__head__|wc -l)
		
		var __HEADER__ : " -H @${__head__}"
	};
	
	def: __req__::Curlexec()
	{
		trap "rm -rf '$nama_con' &> /dev/null; exit" INT SIGINT EXIT
		argv.get_arg ["$1"]; # url
		argv.get_arg ["$2"]; # ch

		var __config__ : $(opt.Curl url="$uri" ch="$CH")
		var __runcurl__ : $(opt.exec_opt config="$__config__")
		@return: __runcurl__
		rm -rf "$nama_con" &> /dev/null
	}
}
