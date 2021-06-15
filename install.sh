#!/bin/bash

clear

echo
echo "░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗";
echo "░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝";
echo "░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░";
echo "░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░";
echo "░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗";
echo "░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝";
echo
read -p "You have installed powerlevel10k? [y/n] " option

function INSTALL_PL10K(){
	echo vamos a instalar pl10k
}

function CONFIG_ZSHRC(){

	# Preguntamos que OS tiene el usuario

	read -p "archlinux or ubuntu? [l/u] " OS_option	

		if [ "$OS_option" = "l" ] || [ "$OS_option" = "L" ]; then
			sudo pacman -Syy
#			sudo pacman -S netcat 
#			sudo pacman -S bat
#			sudo pacman -S python3
#			sudo pacman -S git
#			sudo pacman -S rofi
#			sudo pacman -S dmenu
#			yay -S scrub
#			sudo snap install nvim --classic
			
		elif [ "$OS_option" = "L" ] || [ "$OS_option" = "U" ]; then
			echo "fuera de servicio"

		else
			echo "Option not recognized"
		fi
}

	if [ "$option" = "n" ] || [ "$option" = "N" ]; then
		INSTALL_PL10K

	elif [ "$option" = "y" ] || [ "$option" = "Y" ]; then
		CONFIG_ZSHRC

	else 
		echo "Option not recognized"
	fi

clear

echo 
echo "██████████████████████████████████▀███████████████████████████████████";
echo "█─▄▄▄─█─▄▄─█▄─▀█▄─▄█▄─▄▄─█▄─▄█─▄▄▄▄███████░▄▄░▄█─▄▄▄▄█─█─█▄─▄▄▀█─▄▄▄─█";
echo "█─███▀█─██─██─█▄▀─███─▄████─██─██▄─███░░███▀▄█▀█▄▄▄▄─█─▄─██─▄─▄█─███▀█";
echo "▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▄▀▄▄▄▄▄▀▀▀▄▄▀▀▄▄▄▄▄▀▄▄▄▄▄▀▄▀▄▀▄▄▀▄▄▀▄▄▄▄▄▀";
echo
read -p "Enter your username: " UserName
echo $UserName > user
CodeError=$(python3 rename.py)

if [ "$CodeError" = "perfect"]; then
	cd ~
	rm -rf .zshrc
	cp Coman_zshrc/.zshrc ./

elif [ "$CodeError" = "error" ]; then
	echo "ERROR, restart script" 
else 
	exit
fi
