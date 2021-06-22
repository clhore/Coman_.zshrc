#!/bin/bash

# Author: clhore - aver cabeza almendra

#Colours from https://github.com/s4vitar
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


function dSytem(){
cS="\e[0;36m\033[1m"	
echo -e "${cS}╭━━━╮╱╱╱╱╱╱╭╮${endColour}"
echo -e "${cS}┃╭━╮┃╱╱╱╱╱╭╯╰╮${endColour}"
echo -e "${cS}┃╰━━┳╮╱╭┳━┻╮╭╋━━┳╮╭╮${endColour}"
echo -e "${cS}╰━━╮┃┃╱┃┃━━┫┃┃┃━┫╰╯┃${endColour}"
echo -e "${cS}┃╰━╯┃╰━╯┣━━┃╰┫┃━┫┃┃┃${endColour}"
echo -e "${cS}╰━━━┻━╮╭┻━━┻━┻━━┻┻┻╯${endColour}"
echo -e "${cS}╱╱╱╱╭━╯┃${endColour}"
echo -e "${cS}╱╱╱╱╰━━╯${endColour}"
}

trap ctrl_c INT

function ctrl_c(){
	clear
	echo -e "\n${yellowColour}[*] ${endColour}${grayColour}Saliendo${endColour}"
	sleep 1
	tput cnorm
	exit 0
}

function helpMenu(){
	echo -e "\n${redColour}[*]${endColour} ${yellowColour}Ejecute el comando${endColour} ${greenColour}bash ./install.sh${endColour}\n"
	echo -e "\t${greenColour}[*]${endColour} Como usuario no ${redColour}root${endColoud}"
	echo -e "\t${greenColour}[*]${endColour} Siga todos los pasos que le indique el escript"

}

function p10kIntall(){
	if [ "$ursSistem" == "arch" ]; then
		yay -S --noconfirm zsh-theme-powerlevel10k-git
		echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
	elif [ "$ursSistem" == "ubuntu" ]; then
                echo "esto es ubuntu"
        else
                ctrl_c
        fi
}

function p10kConfig(){
	clear
	echo -e "${redColour}███████████████████████${endColour}${yellowColour}███████████▀████████████████${endColour}${redColour}███████████████████${endColour}";
	echo -e "${redColour}█─▄▄▄─█─▄▄─█▄─▀█▄─▄█▄─▄▄${endColour}${yellowColour}─█▄─▄█─▄▄▄▄███████░▄▄░▄█─▄${endColour}${redColour}▄▄▄█─█─█▄─▄▄▀█─▄▄▄─█${endColour}";
	echo -e "${redColour}█─███▀█─██─██─█▄▀─███─${endColour}${yellowColour}▄████─██─██▄─███░░███▀▄█▀█▄▄▄${endColour}${redColour}▄─█─▄─██─▄─▄█─███▀█${endColour}";
	echo -e "${redColour}▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄${endColour}${yellowColour}▀▀▀▄▄▄▀▄▄▄▄▄▀▀▀▄▄▀▀▄▄▄▄▄▀▄▄${endColour}${redColour}▄▄▄▀▄▀▄▀▄▄▀▄▄▀▄▄▄▄▄▀${endColour}";
	echo
	
	cd /home/"$userName"/Coman_zshrc/
	
	echo $userName > user
	python3 ./rename.py
	echo
	
	read -p 'Introduzca "y" si salio [ perfect ] sino introduzca "n" [Y/n]: ' a

        if [ "$a" = "y" ] || [ "$a" = "Y" ]; then
                cd ~
                rm -rf .zshrc
                cp /home/"$userName"/Coman_zshrc/.zshrc ./
		
		cp -r /home/ad5ian/Coman_zshrc/recursos_zsh /home/ad5ian/.recursos_zsh

        else
                echo "ERROR, restart script"
        fi
	
	echo -ne "\n\t${yellowColour}[*]${endColour}${blueColour} Start${endColour} ${greenColour}==>${endColour} ${purpleColour}p10k configure${endColour}\n"
}

function dependencies(){
	tput civis

	if [ "$ursSistem" == "arch" ]; then
		dependencies=(python3 dmenu rofi bat netcat)
		
		dependenciesYay=(scrub)

		dependenciesSnap=(nvim)

		dependenciesp10K=(.p10k.zsh)

		echo -e "\t${yellowColour}[*]${endColour}${grayColour} Comprobando programas necesarios...${endColour}"
		sleep 2

		
		for program in "${dependencies[@]}"; do
			echo -ne "\n\t${yellowColour}[*]${endColour}${blueColour} Herramienta${endColour}${purpleColour} $program${endColour}${blueColour}...${endColour}"

			test -f /usr/bin/$program
			
			if [ "$(echo $?)" == "0" ]; then
				echo -e " ${greenColour}(V)${endColour}"
			else
				echo -e " ${redColour}(X)${endColour}\n"
				echo -e "\t${yellowColour}[*]${endColour}${grayColour} Instalando herramienta ${endColour}${blueColour}$program${endColour}${yellowColour}...${endColour}"
				sudo pacman -S $program
			fi; sleep 1
		done

		for program in "${dependenciesYay[@]}"; do
                        echo -ne "\n\t${yellowColour}[*]${endColour}${blueColour} Herramienta${endColour}${purpleColour} $program${endColour}${blueColour}...${endColour}"

                        test -f /usr/bin/$program

                        if [ "$(echo $?)" == "0" ]; then
                                echo -e " ${greenColour}(V)${endColour}"
                        else
                                echo -e " ${redColour}(X)${endColour}\n"
                                echo -e "\t${yellowColour}[*]${endColour}${grayColour} Instalando herramienta ${endColour}${blueColour}$program${endColour}${yellowColour}...${endColour}"
                                yay -S $program
                        fi; sleep 1
                done
				
		for program in "${dependenciesSnap[@]}"; do
                        echo -ne "\n\t${yellowColour}[*]${endColour}${blueColour} Herramienta${endColour}${purpleColour} $program${endColour}${blueColour}...${endColour}"

                        test -f /usr/bin/$program

                        if [ "$(echo $?)" == "0" ]; then
                                echo -e " ${greenColour}(V)${endColour}"
                        else
                                echo -e " ${redColour}(X)${endColour}\n"
                                echo -e "\t${yellowColour}[*]${endColour}${grayColour} Instalando herramienta ${endColour}${blueColour}$program${endColour}${yellowColour}...${endColour}"
                                sudo snap install $program --classic
                        fi; sleep 1
                done
		
		for program in "${dependenciesp10K[@]}"; do

                        echo -ne "\n\t${yellowColour}[*]${endColour}${blueColour} Herramienta${endColour}${purpleColour} $program${endColour}${blueColour}...${endColour}"

                        test -f /home/"$userName"/$program

                        if [ "$(echo $?)" == "0" ]; then
                                echo -e " ${greenColour}(V)${endColour}"
                        else
                                echo -e " ${redColour}(X)${endColour}\n"
                                echo -e "\t${yellowColour}[*]${endColour}${grayColour} Instalando herramienta ${endColour}${blueColour}$program${endColour}${yellowColour}...${endColour}"
                                p10kIntall
                        fi; sleep 1
                done


	elif [ "$ursSistem" == "ubuntu" ]; then
		echo "esto es ubuntu"
	else
		ctrl_c
	fi
}

# Main Function

if [ "$(id -u)" == "0" ]; then
	clear
	helpMenu
else
	clear
	dSytem

	read -p "Introduce your UserName: " userName
	
	read -p "Select your sistem [l]ArchLinux [u]Ubuntu [l/u] " vSistem
	

	if [ "$vSistem" == "l" ] || [ "$vSistem" == "L" ]; then
		echo -e "\n\t${greenColour}[*]${endColour} ${yellowColour}Start install${endColour}\n"
		
		ursSistem="arch"
		dependencies
		tput cnorm
		p10kConfig

	elif [ "$vSistem" == "u" ] || [ "$vSistem" == "U" ]; then
                echo -e "\n\t${greenColour}[*]${endColour} ${yellowColour}Start install${endColour}\n"

		ursSistem="ubuntu"
		dependencies
		tput cnorm
		p10kConfig
	
	else
		helpMenu
	fi

fi
