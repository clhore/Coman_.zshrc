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
	clear
	echo -e "\n${redColour}[*]${endColour} ${yellowColour}Ejecute el comando${endColour} ${greenColour}bash ./install.sh${endColour}\n"
	echo -e "\t${greenColour}[*]${endColour} Como usuario no ${redColour}root${endColour}"
	echo -e "\t${greenColour}[*]${endColour} Y como usuario ${redColour}root${endColour}"
	echo -e "\t${greenColour}[*]${endColour} Asegurese que el repositorio se a clonado en el usuario no ${redColour}root${endColour} en el directorio ${greenColour}cd ~${endColour}"
	echo -e "\t${greenColour}[*]${endColour} Siga todos los pasos que le indique el escript"
	sleep 2
	tput cnorm
	exit 0
}

function p10kIntall(){
	if [ "$ursSistem" == "arch" ]; then
		yay -S --noconfirm zsh-theme-powerlevel10k-git
		sleep 1
		cd /home/"$userName"/
		cp ./Coman_zshrc/.p10k.zsh .
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
	
	if [ "$userP" == "notRoot" ]; then
		
		cd /home/"$userName"/Coman_zshrc/
	
		echo $userName > user
		python3 ./rename.py
		echo
	
		read -p 'Introduzca "y" si salio [ perfect ] sino introduzca "n" [Y/n]: ' a

        	if [ "$a" = "y" ] || [ "$a" = "Y" ]; then
                	cd ~
                	sleep 1
                	echo -ne "\n\t${yellowColour}[*]${endColour}${blueColour} Eliminando${endColour} ${greenColour}==>${endColour} ${purpleColour}.zshrc${endColour}\n"
                	rm -rf .zshrc
			sleep 2

			echo -ne "\n\t${yellowColour}[*]${endColour} ${blueColour}Copiando el archivo${endColour} ${greenColour}==>${endColour} ${purpleColour}.zshrc${endColour}\n"
        	        cp /home/"$userName"/Coman_zshrc/.zshrc ./
			sleep 1
			
			echo -ne "\n\t${yellowColour}[*]${endColour} ${blueColour}Configurando el directorio${endColour} ${greenColour}==>${endColour} ${purpleColour}.recursos_zsh${endColour}\n"
			rm -rf /home/"$userName"/Coman_zshrc/recursos_zsh/pcapc/mIp.py
			echo -e "#!/usr/bin/python3\n\nf = open('//home//"$userName"//.recursos_zsh//pcapc//ipV4.txt', 'r+')\n\nf_text= f.read()\nf.truncate(0)\n\nf_text = f_text.replace('addr:', '')\nprint(f_text)\n\nf.close()" > /home/"$userName"/Coman_zshrc/recursos_zsh/pcapc/mIp.py
			cp -r /home/"$userName"/Coman_zshrc/recursos_zsh /home/"$userName"/.recursos_zsh
			sleep 3

			echo -ne "\n\t${yellowColour}[*]${endColour} ${blueColour}Instando la fuente${endColour} ${greenColour}==>${endColour} ${purpleColour}hack nerd fonts${endColour}\n"
			sudo mkdir /usr/share/fonts/hack_font
			sleep 1
			sudo cd /usr/share/fonts/hack_font
			sleep 1
			sudo unzip /home/ad5ian/Coman_zshrc/Hack.zip
			sleep 2
        	else
                	ctrl_c
        	fi
	
		clear
			
	elif [ "$userP" == "Root" ]; then
		
		cd ~
		sleep 3
		echo -ne "\n\t${yellowColour}[*]${endColour} ${blueColour}Copiando el archivo${endColour} ${greenColour}==>${endColour} ${purpleColour}.zshrc${endColour}\n"
		cp /home/ad5ian/.zshrc ./
		
		sleep 2
		clear
		echo -e "\n\t${greenColour}"'>>' $USER"${endColour}"
		sleep 1
		echo -e "\n\t${yellowColour}[*]${endColour}${blueColour} Command${endColour} ${greenColour}==>${endColour} ${purpleColour}su "$USER"${endColour}"
		echo -e "\n\t${yellowColour}[*]${endColour}${blueColour} Command${endColour} ${greenColour}==>${endColour} ${purpleColour}p10k configure${endColour}"
		
		sleep 2
		echo -e "\n\n\t${redColour}>> root${endColour}"
		sleep 1
		echo -e "\n\t${yellowColour}[*]${endColour}${blueColour} Command${endColour} ${greenColour}==>${endColour} ${purpleColour}sudo su${endColour}"
		echo -e "\n\t${yellowColour}[*]${endColour}${blueColour} Command${endColour} ${greenColour}==>${endColour} ${purpleColour}p10k configure${endColour}"
	else
		ctrl_c
	fi
}

function dependencies(){
	tput civis

	if [ "$ursSistem" == "arch" ]; then
		dependencies=(python3 dmenu rofi bat netcat unzip)
		
		dependenciesYay=(scrub)
		
		dependenciesSnap=(nvim)

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

	elif [ "$ursSistem" == "ubuntu" ]; then
		echo "esto es ubuntu"
	else
		ctrl_c
	fi
}

# Main Function
dSytem

read -p "Introduce your UserName: " userName

read -p "Select your sistem [l]ArchLinux [u]Ubuntu [l/u] " vSistem

if [ "$(id -u)" != "0" ]; then
	p10kIntall
	clear
	helpMenu
else
	clear
	
	if [ "$vSistem" == "l" ] || [ "$vSistem" == "L" ]; then
		echo -e "\n\t${greenColour}[*]${endColour} ${yellowColour}Start install${endColour}\n"
		
		ursSistem="arch"

		# Install user not root
		userP="notRoot"
		dependencies
		tput cnorm
		p10kConfig

		# Install user root
		userP="Root"
		USER="$userName"
		userName="root"
		dSytem
		read -sp "presione ENTER si desea realizar el mismo proceso en el usuario root: Ctrl_c para cancelar."
		echo -e "\n"
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
