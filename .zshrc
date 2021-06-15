# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

alias catn='bat'
alias cat='/usr/bin/cat'

function lnvim(){
	ls -la | awk '{print $9}' | rofi -show -dmenu -i | xargs -I_ nvim _
}

function pcapc(){
     	if [ "$1" = "-r" ] || [ "$1" = "-R" ]; then

# Recepcion de archivos y directorios

		if [ "$2" = "f" ] || [ "$2" = "F" ]; then
			ifconfig ens33 | grep "inet " | awk '{print $2}' > /home/ad5ian/.recursos_zsh/envio_recpcion_file_and_directory/ipV4.txt
			echo ">> nc -N $(python3 /home/ad5ian/.recursos_zsh/envio_recpcion_file_and_directory/mIp.py) 44444 < /[ FILE ]"

			nc -lvp 44444 > $3

		elif [ "$2" = "d" ] || [ "$2" = "D" ]; then
			ifconfig ens33 | grep "inet " | awk '{print $2}' > /home/ad5ian/.recursos_zsh/envio_recpcion_file_and_directory/ipV4.txt
			echo ">> tar czp [ DIRECTORIO ]/ | nc -N $(python3 /home/ad5ian/.recursos_zsh/envio_recpcion_file_and_directory/mIp.py) 44444"
		
			nc -lvp 44444 | tar zxv 
	
		else
			echo "error en la sintaxis"
		fi

# Envio de archivos y directorios
     
	elif [ "$1" = "-e" ] || [ "$1" = "-E" ]; then
     	
		if [ "$2" = "f" ] || [ "$2" = "F" ]; then
			
			file=$(ls -la | awk '{print $9}' | rofi -show -dmenu -i)
			ip=$(rofi -show -dmenu -i)
	
			nc -n $ip 44444 < $file

		elif [ "$2" = "d" ] || [ "$2" = "D" ]; then
			
			direc=$(ls -la | awk '{print $9}' | rofi -show -dmenu -i)
			ip=$(rofi -show -dmenu -i)

			tar czp $direc | nc -n $ip 44444

		else
                	echo "error en la sintaxis"
        	fi

	else
	
		echo 'error en la sintaxis'

	fi
}

function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}
