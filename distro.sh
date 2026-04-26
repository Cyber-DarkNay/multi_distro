#!/data/data/com.termux/files/usr/bin/bash

# WARNA
r='\033[1;31m'
g='\033[1;32m'
y='\033[1;33m'
c='\033[1;36m'
w='\033[1;37m'

# ===== BANNER =====
banner() {
clear
echo -e "$c"
echo "╔══════════════════════════════════════╗"
echo "║   CYBER DARKNAY MULTI DISTRO TOOL   ║"
echo "╚══════════════════════════════════════╝"
echo -e "$y     Termux Proot Distro Manager"
echo -e "$g        Author: Cyber DarkNay"
echo -e "$w========================================"
}

# ===== MENU =====
menu() {
echo -e "$c[1] Install Distro"
echo -e "$c[2] Masuk Distro"
echo -e "$c[3] List Distro"
echo -e "$c[4] Hapus Distro"
echo -e "$c[5] Info System"
echo -e "$c[0] Exit"
echo -e "$w========================================"
}

pause() {
echo ""
read -p "Tekan ENTER untuk lanjut..." dummy
}

# ===== FITUR =====

install_distro() {
echo -e "$y Pilih Distro:"
echo "[1] ubuntu"
echo "[2] debian"
echo "[3] archlinux"
echo "[4] alpine"
echo "[5] fedora"
echo "[6] manjaro"
echo "[7] void"
echo "[8] opensuse"
echo "[9] deepin"
echo "[10] almalinux"
echo "[11] rockylinux"
read -p "Nomor: " d

case $d in
1) distro="ubuntu" ;;
2) distro="debian" ;;
3) distro="archlinux" ;;
4) distro="alpine" ;;
5) distro="fedora" ;;
6) distro="manjaro" ;;
7) distro="void" ;;
8) distro="opensuse" ;;
9) distro="deepin" ;;
10) distro="almalinux" ;;
11) distro="rockylinux" ;;
*) echo -e "$r[!] Salah pilih"; return ;;
esac

echo -e "$g[+] Install $distro..."
proot-distro install $distro
}

login_distro() {
echo -e "$y[+] Distro terinstall:"
proot-distro list-installed

read -p "Masukkan nama distro: " distro

[ -z "$distro" ] && echo -e "$r[!] Kosong!" && return

proot-distro login $distro
}

list_distro() {
proot-distro list-installed
}

delete_distro() {
proot-distro list-installed
read -p "Hapus distro: " distro

[ -z "$distro" ] && echo -e "$r[!] Kosong!" && return

proot-distro remove $distro
echo -e "$g[✓] Berhasil"
}

info_system() {
uname -a
echo ""
df -h
}

# ===== INIT =====
pkg install -y proot-distro > /dev/null 2>&1

# ===== MAIN LOOP =====
while true; do
banner
menu

read -p "Pilih menu: " pilih

case "$pilih" in
1) install_distro ;;
2) login_distro ;;
3) list_distro ;;
4) delete_distro ;;
5) info_system ;;
0) exit ;;
*) echo -e "$r[!] Pilihan tidak ada!" ;;
esac

pause
done