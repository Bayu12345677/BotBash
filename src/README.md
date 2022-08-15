# BotBash
Cara menambahkan fitur di dalam Script BotBash 
<details open>
  <summary><strong> Menambah Fitur </strong></summary>

  ```php
  $ buka folder src/utils
  $ jika sudah di buka folder nya kalian buat file dengan bahasa bebas saya contohkan menggunakan bahasa python
  $ buat file namafile.py > nano coba.py
  $ masukan > print ('halo teman') 
  $ lalu kalian simpan klik CTRL + X + Y
  ```
  </details>

<details open>
  <summary><strong> Menambah Fitur coba.py </strong></summary>

  ```php
  $ kalian balik di folder awal BotBash lalu buka folder src
  $ buka file config.txk > nano config.txk
  $ Masukan > 
     Config.set_feature nomor Fitur -\> nama fitur
     Config.setCommand "python utils/namafile.py"
     Config.exec_operator

     Config.set_feature 3 -\> bot chat
     Config.setCommand "python utils/coba.py"
     Config.exec_operator
  $ lalu kalian simpan klik CTRL + X + Y
  ```
  </details>

<details open>
  <summary><strong> Cek Fitur Yang Sudah di Tambahkan </strong></summary>

  ```php
  $ kalian balik di folder awal BotBash lalu kalian ketik
  $ make app
  $ Ketik Menu
  ```
  </details>


