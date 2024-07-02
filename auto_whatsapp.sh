G='\e[01;32m'	# GREEN
R='\e[01;31m'	# RED
Y='\e[01;33m'	# YELLOW
B='\e[01;34m'	# BLUE
V='\e[01;35m'	# VIOLET
Bl='\e[01;a30m'   # BLACK
C='\e[01;36m'	# CYAN
W='\e[01;37m'	# WHITE
N='\e[00;37;40m' # NEUTRAL
DIRECTORY=/sdcard/waWa-ori

function ceknomer(){
    file_path="/data/data/com.whatsapp/shared_prefs/registration.RegisterPhone.xml"
    phone_number=$(sed -n 's/.*<string name="com.whatsapp.registration.RegisterPhone.phone_number">\([^<]*\)<\/string>.*/\1/p' "$file_path")
    echo -e " >$Y Nomor ->$G $phone_number $N"
    echo "62$phone_number" >>restore.txt
}
function cekrc(){
    FiILE=/data/data/com.whatsapp/files/rc2
    if test -f "$FiILE"
    then
        echo -e "$G > Akun Aman $N"
    else
        echo -e "$Y > Akun Rawan$N"
    fi
}

function tutupApp(){
    am force-stop $1 >/dev/null
    pm clear $1 >/dev/null
}
function openApp(){
    echo -e " > Open App"
    am monkey --user 0 -n $1/com.whatsapp.Main >/dev/null
    sleep 2.5
}
function openwa(){
    echo -e " > Open App"
    am start --user 0 -n $1/com.whatsapp.Main >/dev/null
    sleep 2.5
}
function openCaptcha(){
    echo -e " > Direct Open"
    am start --user 0 -n $1/com.whatsapp.registration.VerifyCaptcha >/dev/null
    sleep 2.5
}

function modpesOn(){
    settings put global airplane_mode_on 1
    am broadcast -a android.intent.action.AIRPLANE_MODE >/dev/null
    sleep 0.5
}
function modpesOff(){
    settings put global airplane_mode_on 0
    am broadcast -a android.intent.action.AIRPLANE_MODE >/dev/null
    sleep 0.5
}
function wipeData(){
    echo -e " > Wipe Data"
    pm clear --user 0 com.whatsapp >/dev/null
    sleep 1
}
function killApp(){
    am kill com.whatsapp >/dev/null
    sleep 0.5
    am force-stop com.whatsapp >/dev/null
}
function isi(){
    input text $1
}
function enter(){
    input keyevent KEYCODE_ENTER
}
function back(){
    input keyevent 4
}
function klik(){
    input tap $1 $2
}
function scroll(){
    input swipe $1 $2 $3 $4 $5
}
function kursor(){
    input keyevent KEYCODE_DPAD_$1
}
function banner(){
    clear
    listnomer
    echo -e "$W+-------------------------------+$N"
    echo -e "$G Script/Bot WhatsApp $W- $Y Semi Auto$N"
    echo -e "$C Maintained By @itsaoda$N"
    echo -e "$W+-------------------------------+\n$N"
}
function listnomer(){
    FILEi='nomer.txt'
    echo -e "$G+------------------+$N"
    echo -e "$G #List Nomer:$N"
    if test -f "$FILEi"
    then
        for no in $(cat $FILEi)
        do
            echo -e "$V- $no$N"
        done
    else
        echo -e "$R > File nomer.txt belum dibuat/tidak ditemukan$N"
        echo  "$Y Harap Isi Nomor Terlebih Dahulu $N"
        touch nomer.txt
    fi
}
acak1() {
    IDKEY=$(grep -n "userkey" /data/system/users/0/settings_ssaid.xml | grep -o 'defaultValue=".*"*' | cut -d '"' -f2)
    #IDV1=$(grep -n "game.joyit.welfare" /data/system/users/0/settings_ssaid.xml | grep -o 'value=".*"*' | cut -d '"' -f2)
    IDLINE1=$(grep -n "com.google.android.gms" /data/system/users/0/settings_ssaid.xml | grep -o 'value=".*"*' | cut -d '"' -f2)
    IDPS1=$(grep -n "com.android.vending" /data/system/users/0/settings_ssaid.xml | grep -o 'value=".*"*' | cut -d '"' -f2)
    
    IDRANDOM=$(head -3 /dev/urandom | tr -cd $IDKEY | cut -c -16)
    IDLINERANDOM=$(head -3 /dev/urandom | tr -cd $IDKEY | cut -c -16)
    IDPSRANDOM=$(head -3 /dev/urandom | tr -cd $IDKEY | cut -c -16)
    
    sed -i "s/$IDLINE1/$IDLINERANDOM/g" /data/system/users/0/settings_ssaid.xml
    sed -i "s/$IDV1/$IDRANDOM/g" /data/system/users/0/settings_ssaid.xml
    sed -i "s/$IDPS1/$IDPSRANDOM/g" /data/system/users/0/settings_ssaid.xml
    
    #echo -e "${W}JOY ID berhasil dirubah menjadi ${R}$(grep -n "game.joyit.welfare" /data/system/users/0/settings_ssaid.xml | grep -o 'value=".*"*' | cut -d '"' -f2) "
    sleep 0.2
}
acak2() {
    IDKEY=$(grep -n "userkey" /data/system/users/0/settings_ssaid.xml | grep -o 'defaultValue=".*"*' | cut -d '"' -f2)
    #IDV2=$(grep -n "game.joyit.welfare" /data/system/users/0/settings_ssaid.xml | grep -o 'defaultValue=".*"*' | cut -d '"' -f2)
    IDPS2=$(grep -n "com.android.vending" /data/system/users/0/settings_ssaid.xml | grep -o 'defaultValue=".*"*' | cut -d '"' -f2)
    IDPSRANDOM2=$(head -3 /dev/urandom | tr -cd $IDKEY | cut -c -16)
    
    IDRANDOM2=$(head -3 /dev/urandom | tr -cd $IDKEY | cut -c -16)
    IDLINE2=$(grep -n "com.google.android.gms" /data/system/users/0/settings_ssaid.xml | grep -o 'defaultValue=".*"*' | cut -d '"' -f2)
    
    IDLINERANDOM2=$(head -3 /dev/urandom | tr -cd $IDKEY | cut -c -16)
    sed -i "s/$IDLINE2/$IDLINERANDOM2/g" /data/system/users/0/settings_ssaid.xml >/dev/null
    sed -i "s/$IDV2/$IDRANDOM2/g" /data/system/users/0/settings_ssaid.xml >/dev/null
    sed -i "s/$IDPS2/$IDPSRANDOM2/g" /data/system/users/0/settings_ssaid.xml >/dev/null
    #echo -e "${W}Default ID berhasil dirubah menjadi ${R}$(grep -n "game.joyit.welfare" /data/system/users/0/settings_ssaid.xml | grep -o 'defaultValue=".*"*' | cut -d '"' -f2) "
    sleep 0.2
}

acakserial() {
    IDRANDOM3=$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)$(head -3 /dev/urandom | tr -cd 'a-f0-9' | cut -c -1)
    SERIAL=$(grep -i "CUSTOMPROPSPOST" /data/adb/mhpc/propsconf_late | grep -i "ro.serialno=" | cut -d '"' -f2 | cut -d '=' -f2)
    SERIAL2=$(grep -i "CUSTOMPROPSLATE" /data/adb/mhpc/propsconf_late | grep -i "ro.serialno=" | cut -d '"' -f2 | cut -d '=' -f2)
    sed -i "s/$SERIAL/$IDRANDOM3/g" /data/adb/mhpc/propsconf_late >/dev/null
    sed -i "s/$SERIAL2/$IDRANDOM3/g" /data/adb/mhpc/propsconf_late >/dev/null
    # echo -e "${W}SERIAL device berhasil dirubah ${R} $(grep -n "ro.serialno=" /data/adb/mhpc/propsconf_late |  cut -d '"' -f2 | cut -d '=' -f2) "
    sleep 1
}
function clearAppData(){
    echo -e " > Delete App Data"
    am force-stop com.whatsapp >/dev/null
    rm -r /data/data/com.whatsapp/app_account_switching/ >/dev/null
    rm -r /data/data/com.whatsapp/app_minidumps/ >/dev/null
    rm -r /data/data/com.whatsapp/cache/ >/dev/null
    rm -r /data/data/com.whatsapp/files/decompressed/ >/dev/null
    # rm -r /data/data/com.whatsapp/code_cache/ >/dev/null
    # rm -r /data/data/com.whatsapp/lib/ >/dev/null
    rm -r /data/data/com.whatsapp/lib-main/ >/dev/null
    rm -r /data/data/com.whatsapp/no_backup/ >/dev/null
    sleep 1
}

function backup(){
    echo -e "$G # Backup File WhatsApp$N"
    # modpesOn
    cekrc
    clearAppData
    if [ ! -d "$DIRECTORY" ]; then
        echo -e "$R > Folder $DIRECTORY Tidak Ditemukan$N"
        echo -e "$Y > Membuat Folder $DIRECTORY ...$N"
        mkdir $DIRECTORY >/dev/null
        sleep 0.5
    fi
    echo -e "$Y > Compress Backup WhatsApp Ke $DIRECTORY $N"
    tar -zcf $DIRECTORY/com.whatsapp-$(date "+%Y%m%d-%H%M%S").tar.gz /data/data/com.whatsapp >/dev/null
    echo -e "$G > Done$N"
    tutupApp com.whatsapp
    # modpesOff
}
function backupWAbis(){
    
    echo -e "${Y} Betmen, Silahkan menggunakan whatsapp full original playstore${N}"
    echo -e "${Y} Mau setor Tar.gz yang pastinya amanah? Hubungi betmen${N}"
    echo -e "${Y} WA: ${R}0882-6829-0944${N}"
    echo -e "${Y} Tele: ${C}@BETMEN_wat${N}"
    mkdir /sdcard/waWa-Bisnis
    tamaaa(){
        echo $(head -3 /dev/urandom | tr -cd 'A-Z0-9' | cut -c -5)
    }
    settings put global airplane_mode_on 1
    am broadcast -a android.intent.action.AIRPLANE_MODE
    am force-stop com.whatsapp.w4b
    TEME=/data/data/com.whatsapp.w4b/files/rc2
    if [ -f "$TEME" ]; then
        echo -e "${Y}Betmen, ID di temukan, Melanjutkan proses membackup${N}"
        sleep 4
        rm -rf /data/local/tmp
        mkdir /data/local/tmp
        mkdir /data/local/tmp/com.whatsapp.w4b
        mkdir /data/local/tmp/com.whatsapp.w4b/databases
        mkdir /data/local/tmp/com.whatsapp.w4b/files
        mkdir /data/local/tmp/com.whatsapp.w4b/shared_prefs
        mkdir /sdcard/waWa-Bisnis/setoran
        clear
        sleep 0.5
        cp -r -f /data/data/com.whatsapp.w4b/databases/axolotl.db /data/local/tmp/com.whatsapp.w4b/databases
        cp -r -f /data/data/com.whatsapp.w4b/databases/axolotl.db-shm /data/local/tmp/com.whatsapp.w4b/databases
        cp -r -f /data/data/com.whatsapp.w4b/databases/axolotl.db-wal /data/local/tmp/com.whatsapp.w4b/databases
        clear
        sleep 0.5
        cp -r -f /data/data/com.whatsapp.w4b/files/me /data/local/tmp/com.whatsapp.w4b/files
        cp -r -f /data/data/com.whatsapp.w4b/files/rc2 /data/local/tmp/com.whatsapp.w4b/files
        clear
        sleep 0.5
        cp -r -f /data/data/com.whatsapp.w4b/shared_prefs/com.whatsapp.w4b_preferences_light.xml /data/local/tmp/com.whatsapp.w4b/shared_prefs
        cp -r -f /data/data/com.whatsapp.w4b/shared_prefs/keystore.xml /data/local/tmp/com.whatsapp.w4b/shared_prefs
        clear
        sleep 0.5
        echo '<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
        <map>
        <int name="com.whatsapp.registration.RegisterPhone.country_code_position" value="-1" />
        <int name="com.whatsapp.registration.RegisterPhone.phone_number_position" value="12" />
        <string name="com.whatsapp.registration.RegisterPhone.input_country_code">62</string>
        <string name="com.whatsapp.registration.RegisterPhone.country_code">62</string>' > /data/local/tmp/com.whatsapp.w4b/shared_prefs/com.whatsapp.registration.RegisterPhone.xml
        clear
        sleep 1
        grep -i '<string name="ph">8*' /data/local/tmp/com.whatsapp.w4b/shared_prefs/com.whatsapp.w4b_preferences_light.xml >> /data/local/tmp/com.whatsapp.w4b/shared_prefs/com.whatsapp.registration.RegisterPhone.xml
        clear
        sleep 0.5
        sed -i "s/ph/com.whatsapp.registration.RegisterPhone.phone_number/g" /data/local/tmp/com.whatsapp.w4b/shared_prefs/com.whatsapp.registration.RegisterPhone.xml
        clear
        sleep 0.5
        tar -zcf /sdcard/waWa-Bisnis/setoran/BetmenWB-$('tamaaa')-$(date "+%H%M%S").tar.gz /data/local/tmp/com.whatsapp.w4b
    else
        echo -e "${Y}Betmen, ID tidak di temukan, Melanjutkan proses membackup${N}"
        sleep 4
        rm -r /data/data/com.whatsapp.w4b/app_account_switching/
        rm -r /data/data/com.whatsapp.w4b/app_minidumps/
        rm -r /data/data/com.whatsapp.w4b/cache/
        rm -r /data/data/com.whatsapp.w4b/code_cache/
        rm -r /data/data/com.whatsapp.w4b/files/decompressed/
        rm -r /data/data/com.whatsapp.w4b/lib/
        rm -r /data/data/com.whatsapp.w4b/lib-main/
        rm -r /data/data/com.whatsapp.w4b/no_backup/
        clear
        mkdir /sdcard/waWa-Bisnis/banned
        tar -zcf /sdcard/waWa-Bisnis/banned/com.whatsapp.w4b-$(date "+%Y%m%d-%H%M%S").tar.gz /data/data/com.whatsapp.w4b
    fi
    am force-stop com.whatsapp
    am force-stop com.whatsapp.w4b
    pm clear com.whatsapp
    pm clear com.whatsapp.w4b
    settings put global airplane_mode_on 0
    am broadcast -a android.intent.action.AIRPLANE_MODE
}

function applyPermission(){
    echo -e " > Apply Permission"
    pm grant $1 android.permission.ACCESS_COARSE_LOCATION >/dev/null
    pm grant $1 android.permission.ACCESS_FINE_LOCATION >/dev/null
    pm grant $1 android.permission.ACCESS_MEDIA_LOCATION >/dev/null
    pm grant $1 android.permission.ANSWER_PHONE_CALLS >/dev/null
    pm grant $1 android.permission.CALL_PHONE >/dev/null
    pm grant $1 android.permission.CAMERA >/dev/null
    pm grant $1 android.permission.READ_CALL_LOG >/dev/null
    pm grant $1 android.permission.READ_CONTACTS >/dev/null
    pm grant $1 android.permission.READ_EXTERNAL_STORAGE >/dev/null
    pm grant $1 android.permission.READ_PHONE_NUMBERS >/dev/null
    pm grant $1 android.permission.READ_PHONE_STATE >/dev/null
    pm grant $1 android.permission.RECEIVE_SMS >/dev/null
    pm grant $1 android.permission.RECORD_AUDIO >/dev/null
    pm grant $1 android.permission.SEND_SMS >/dev/null
    pm grant $1 android.permission.WRITE_CONTACTS >/dev/null
    pm grant $1 android.permission.WRITE_EXTERNAL_STORAGE >/dev/null
    pm grant $1 android.permission.GET_ACCOUNTS >/dev/null
    sleep 0.5
}
function tinjau(){
    no=$1
    echo -e "\n$G > Tinjau Akun -> $no $N"
    wipeData
    openApp com.whatsapp
    killApp
    openCaptcha com.whatsapp
    isi $no
    enter
    enter
    sleep 3
    klik 500 2130 #request review
    sleep 0.5
    klik 500 650 #klik kolom
    sleep 0.5
    input text "tolong%saktivasi%sulang%sakun%swhatsapp%ssaya"
    klik 500 925 #submit
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
function fakereboot(){
    am broadcast -a android.intent.action.BOOT_COMPLETED >/dev/null
}

function autocaptcha(){
    capt="/data/data/$1/files/captcha_audio.mp3"
    if test -f "$capt"
    then
        echo -e "$Y > Captcha Terdeteksi $N"
    else
        echo -e "$W > Captcha Tidak Ditemukan $N"
    fi
}
function regis(){
    no=$1
    echo -e "\n$G > Regis WhatsApp Nomer ->$Y $no $N"
    acak2
    acakserial
    fakereboot
    modpesOn
    wipeData
    openApp com.whatsapp
    modpesOff
    sleep 3.5
    applyPermission com.whatsapp
    openCaptcha com.whatsapp
    isi $no
    enter
    enter
    sleep 2.5
    klik 880 1330 #Tombol OK
    klik 500 1480 #Verifikasi lainnya
    klik 500 2130 #call me
    echo -en "$V [ 1. Backup Ori / 2. Pindah Wabis / Skip(Lanjut) ] : "
    read skipbackup
    case "$skipbackup" in
        1)
            backup
            sed -i '1d' $FILE
            echo -e "$Y > Delete Number From List $N"
        ;;
        2)
            regis2
        ;;
        *)
            am force-stop com.whatsapp >/dev/null
            am force-stop com.whatsapp.w4b >/dev/null
            pm clear com.whatsapp >/dev/null
            pm clear com.whatsapp.w4b >/dev/null
            echo -e "$1" >>$FILE
            sed -i '1d' $FILE
            echo -e "$W > Skip & Putar Posisi Nomor $N"
        ;;
    esac
}
function regis2(){
    no=$1
    echo -e "\n$G > Terjang WA Bisnis Nomer ->$Y $no $N"
    am force-stop com.whatsapp >/dev/null
    am force-stop com.whatsapp.w4b >/dev/null
    pm clear com.whatsapp.w4b >/dev/null
    pm grant com.whatsapp.w4b android.permission.READ_CALL_LOG >/dev/null
    pm grant com.whatsapp.w4b android.permission.CALL_PHONE >/dev/null
    pm grant com.whatsapp.w4b android.permission.ACCESS_MEDIA_LOCATION >/dev/null
    pm grant com.whatsapp.w4b android.permission.READ_CONTACTS >/dev/null
    openwa com.whatsapp.w4b
    kursor DOWN
    kursor DOWN
    kursor DOWN
    enter
    kursor DOWN
    kursor DOWN
    kursor DOWN
    kursor UP
    enter
    echo -en "$V [ 1. Backup Ori / 2. Backup Bisnis / Skip(Lanjut) ] : "
    read skipbackup
    case "$skipbackup" in
        1)
            backup
            sed -i '1d' $FILE
            echo -e "$Y > Delete Number From List $N"
        ;;
        2)
            backupWAbis
            sed -i '1d' $FILE
            echo -e "$Y > Delete Number From List $N"
        ;;
        *)
            am force-stop com.whatsapp >/dev/null
            am force-stop com.whatsapp.w4b >/dev/null
            pm clear com.whatsapp >/dev/null
            pm clear com.whatsapp.w4b >/dev/null
            echo -e "$1" >>$FILE
            sed -i '1d' $FILE
            echo -e "$W > Skip & Putar Posisi Nomor $N"
        ;;
    esac
}
function regisWA(){
    FILE='nomer.txt'
    
    if test -f "$FILE"
    then
        #echo -e "$G > $N"
        for no in $(cat $FILE)
        do
            regis $no
        done
        #else
        #echo -e "$R > $N"
    fi
}

function restore(){
	file=$1
	echo -e "\n$G > $file $N"
	wipeData
	openApp com.whatsapp
	killApp
	applyPermission com.whatsapp
	tar -xzf $file -C / && ceknomer
	openwa com.whatsapp
	echo -en "$V [ d. Delete / Skip((kosongkan) ] $N"
    read resst
    case "$resst" in
    d)
        echo -e "$Y > Menghapus File Dari List $N"
        rm $file
        ;;
    *)
        echo -e " > Skip"
        ;;

    esac

}

function restoreWA(){
	echo -e "$G# Restore Whatsapp$N"
	for ftar in $(ls $DIRECTORY)
	do
		file="$DIRECTORY/$ftar"
		if test -f "$file"
		then
			restore $file
		fi
	done
}
function wabis(){
    openApp com.whatsapp.w4b
    klik 530 2100 #agree
    applyPermission com.whatsapp.w4b
    sleep 0.5
    klik 530 1925 #use nomer
    sleep 2.5
    sleep 5 #captcha
    openApp com.whatsapp
    klik 840 1390
}
function restorekewabis(){
    echo -e "$G# Restore Whatsapp + Auto Regis Wa Bisnis$N"
    for ftar in $(ls $DIRECTORY)
    do
        file="$DIRECTORY/$ftar"
        if test -f "$file"
        then
            restore $file
            wabis
            echo -en "$V [ Tekan Enter Untuk Melanjutkan ] $N"
            read
        fi
    done
}
function setsize(){
    wm size 1080x2340
    wm density 409
}
function resetsize(){
    wm size reset
    wm density reset
}
banner
echo -e "$Y [1] $G Regis WhatsApp (from txt) $N"
echo -e "$Y [2] $G Backup WhatsApp$N"
echo -e "$Y [3] $G Restore Akun $N"
echo -e "$Y [4] $G Tinjau Akun WhatsApp(from txt)$N"
echo -e "$Y [5] $G Sortir targz (Cek Dobel & akun kosong) $N"
echo -e "$Y [a] $G Auto Sinkrorn Resolusi $N"
echo -e "$Y [b] $G Reset Resolusi $N"
echo -e "$W+-------------------------------+$N"
echo -e "$B # Lokasi Folder Default: $DIRECTORY \n\n$N"
echo -en "$Y [?] Opsi : "
read menu
case "$menu" in
    1)
        regisWA
    ;;
    2)
        backup
    ;;
    3)
        restoreWA
    ;;
    4)
        tinjauWA
    ;;
    5)
        sortirwa
    ;;
    a)
        setsize
    ;;
    b)
        resetsize
    ;;
    *)
        exit
    ;;
esac


