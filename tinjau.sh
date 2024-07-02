#!/bin/bash

G='\e[01;32m'
R='\e[01;31m'
Y='\e[01;33m'
B='\e[01;34m'
V='\e[01;35m'
Bl='\e[01;30m'
C='\e[01;36m'
W='\e[01;37m'
N='\e[00;37;40m'

function openApp() {
    echo -e " > Open App"
    am start --user 0 -n "$1/com.whatsapp.Main" >/dev/null
    sleep 2.5
}

function openCaptcha() {
    echo -e " > Direct Open"
    am start --user 0 -n com.whatsapp/com.whatsapp.registration.VerifyCaptcha >/dev/null
    sleep 2.5
}

function wipeData() {
    echo -e " > Wipe Data"
    pm clear --user 0 com.whatsapp >/dev/null
    sleep 1
}

function killApp() {
    am kill com.whatsapp >/dev/null
    sleep 0.5
    am force-stop com.whatsapp >/dev/null
}

function isi() {
    input text "$1"
}

function enter() {
    input keyevent KEYCODE_ENTER
}

function klik() {
    input tap "$1" "$2"
}

function tinjau(){
	no=$1
	echo -e "\n$G > Tinjau Akun -> $no $N"
	wipeData
	openApp com.whatsapp
	killApp
	openCaptcha
	isi $no
	enter
	enter
	sleep 3
	klik 500 2130
	sleep 0.5
	klik 500 650
	sleep 0.5
	input text "tolong%saktivasi%sulang%sakun%swhatsapp%ssaya"
	klik 500 925
	sleep 2.5
	echo -e " > Menghapus nomor dari list $N"
	echo $no >>sudahTinjau.txt
	sed -i '1d' tinjau.txt
	killApp
	echo -e "$V > Done $N"
}
function tinjauWA(){
	for nomer in $(cat tinjau.txt)
	do
		tinjau $nomer
	done
}
function banner() {
    clear
    echo -e "$W+-------------------------------+$N"
    echo -e "$G Script/Bot WhatsApp $N"
    echo -e "$Y Maintained By$C @itsaoda$N"
    echo -e "$Y Channel : t.me/aodaaaa$N"
    echo -e "$W+-------------------------------+\n$N"
}

banner
tinjauWA
