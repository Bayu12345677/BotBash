# Creator : Xenzi Ganz
# Janggan lupa subs

###----------[ ANSII COLOR STYLE ]---------- ###
Z2 = "\x1b[0;90m"     # Hitam
M2 = "\x1b[38;5;196m" # Merah
H2 = "\x1b[38;5;46m"  # Hijau
K2 = "\x1b[38;5;226m" # Kuning
B2 = "\x1b[38;5;44m"  # Biru
U2 = "\x1b[0;95m"     # Ungu
O2 = "\x1b[0;96m"     # Biru Muda
P2 = "\x1b[38;5;231m" # Putih
J2 = "\x1b[38;5;208m" # Jingga
A2 = "\x1b[38;5;248m" # Abu-Abu
###----------[ ANSII COLOR STYLE 2 ]---------- ###
P1 = "\033[37;7;1m"
M1 = "\033[31;7;1m"
H1 = "\033[32;7;1m"
K1 = "\033[33;7;1m"
B1 = "\033[34;7;1m"
U1 = "\033[35;7;1m"
O1 = "\033[36;7;1m"
A1 = "\033[0m"
L1 = "\033[4m"
###----------[ ANSII COLOR STYLE 3 ]---------- ###
Z = "\x1b[1;90m"
M = "\x1b[1;91m"
H = "\x1b[1;92m"
K = "\x1b[1;93m"
B = "\x1b[1;94m"
U = "\x1b[1;95m"
O = "\x1b[1;96m"
P = "\x1b[1;97m"
import os,sys
try:
        import requests
except ImportError as e:
        print (f" {M}• {P}Sedang intall bahan {H}{e.name}, {P}Mohon Tunggu...")
        os.system(f"python -m pip install {e.name} &> /dev/null")
try:
        import bs4
except ImportError as e:
        print (f" {M}• {P}Sedang intall bahan {H}{e.name}, {P}Mohon Tunggu...")
        os.system(f"python -m pip install {e.name} &> /dev/null")

import time, os, requests, json, random, bs4
xyz = requests.Session()
war = random.choice([O,U,K])
banner = f"""{war}

 _______      __  ___                  __             __
/_  __/ | /| / / / _ \___ _    _____  / /__  ___ ____/ /
 / /  | |/ |/ / / // / _ \ |/|/ / _ \/ / _ \/ _ `/ _  / 
/_/   |__/|__/ /____/\___/__,__/_//_/_/\___/\_,_/\_,_/  

   {M}• {P}Author {M}: {P}Xenzi Ganz
   {M}• {P}Github {M}: {K}/Aldi098 - /Xenzi-XN1
   {M}• {P}Team   {M}: {H}Team Xenzi, XTC | Code Team, Dark Club

 {M}• {P}Masukan Link Video Twitter {M}({H}https://mobile.twitter.com/balbalbal{M})"""

path = "/storage/emulated/0/Download-video-twitter"
try:
        os.mkdir(path)
except:
        pass


class Logo:
	def __init__(self):
		pass

	def logo(self):
		os.system('clear')
		print (banner)

class Main:
	def __init__(self):
		pass

	def dow_tw(self, id_vid, nama_vid):
		nm_vid = f"twitter_download_{nama_vid}"
		try:
			print (f' {M}• {P}Sedang Mendownload Video {M}....')
			run = xyz.get(id_vid).content
			with open(f"{path}/{nm_vid}.mp4", "wb") as sv:
				sv.write(run)
				print (f'\n {M}• {P}Tersimpan di {M}: {H}{path}/{nm_vid}.mp4')
		except:
			exit(f' {M}• {P}Url/Video Eror XD')

	def get_dat(self, url):
		data = {'URL': url}
		try:
			data = requests.post('https://twdown.net/download.php',data=data).text
			print (f'\n {M}• {P}01{M}. {P}Kualitas Video 320x568, MP4')
			print (f' {M}• {P}02{M}. {P}Kualitas Video 480x852, MP4')
			print (f' {M}• {P}03{M}. {P}Kualitas Video 720x1280, MP4')
			gas = input(f'\n {M}• {P}Pilih Nomer {M}:{H} ')
			if gas in ['01','1']:
				kl_vd = data.split('download href="')[1];
				id_vid = kl_vd.split('"')[0];
				nama_vid = input(f'\n {M}• {P}Masukan Nama Video {M}[{P}OUTPUT{M}]{M}:{H} ')
				self.dow_tw(id_vid, nama_vid)
			elif gas in ['02','2']:
				kl_vd = data.split('download href="')[2];
				id_vid = kl_vd.split('"')[0];
				nama_vid = input(f'\n {M}• {P}Masukan Nama Video {M}[{P}OUTPUT{M}]{M}:{H} ')
				self.dow_tw(id_vid, nama_vid)
			elif gas in ['03','3']:
				kl_vd = data.split('download href="')[3];
				id_vid = kl_vd.split('"')[0];
				nama_vid = input(f'\n {M}• {P}Masukan Nama Video {M}[{P}OUTPUT{M}]{M}:{H} ')
				self.dow_tw(id_vid, nama_vid)
			else:
				exit(f' {M}• {P}Thanks udah pake tools aing >_')


		except:
			exit(f' {M}• {P}Url/Video Eror XD')
	def mulai(self):
		Logo().logo()
		url = input(f' {M}• {P}Link {M}:{H} ')
		if url in ['']:
			exit(f' {M}• {P}Masukan link Dengan Benar -_-')
		else:
			self.get_dat(url)

if __name__=="__main__":
	Main().mulai()
