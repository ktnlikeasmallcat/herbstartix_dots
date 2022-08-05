#refresh bash
alias rebash='source ~/.bashrc'

#shorthand for herbstclient
alias hc='herbstclient'

#toggle wifi
alias togglewifi='connmanctl disable wifi && sleep 10 && connmanctl enable wifi'

#fonts
alias refont='sudo fc-cache -f -v && fc-cache -f -v'

#default 
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

#CAVA
alias gaycava='cava -p ~/.config/cava/gay'
alias transcava='cava -p ~/.config/cava/trans'

# for updating grub and initramfs
alias upingrub='sudo update-initramfs -u && sudo update-grub'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="sudo du -S | sort -n -r |more"

#safe fileops
alias rm='rm -iv'
alias cp='cp -i'
alias mv='mv -i'

#cd into mkdir
alias mkdircd='mkcd'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

#duckduckgo
alias ddg='ddgr -n 5 --unsafe --url-handler lynx'

#youtube download
alias yt='youtube-dl'

#open caja fom terminal in current location
alias caja-here='caja $(pwd)'

#BLOODY Figlet
alias bloody='figlet -t -d /home/ktn/.figlet/figlet-fonts-master -f Bloody'
#Poison Figlet
alias poison='figlet -t -d /home/ktn/.figlet/figlet-fonts-master -f Poison'
#THIS Figlet
alias thisfiglet='figlet -t -d /home/ktn/.figlet/figlet-fonts-master -f THIS'
#Cybersmall figlet
alias cyberfiglet='figlet -t -d /home/ktn/.figlet/figlet-fonts-master -f Cybersmall'

#ttyclock options
alias tty-clock="tty-clock -S -srt -f %a,%B_%d"

#lmm-slidez
alias mkslides="lmm-slidez -r -f -i ~/.backgrounds"

#Pacman assumes sudo
alias pacman='sudo pacman'

#Visudo runs with nano
alias visudo='EDITOR=nano visudo'

#30 min timer with announcements at 15sec
alias timer30="termdown 30m -v en-us+f4 --critical 5"
alias timer15="termdown 15m -v en-us+f4 --critical 5"
alias timer10="termdown 10m -v en-us+f4 --critical 5"
alias timer5="termdown 5m -v en-us+f4 --critical 5"

#herbstluft config
alias herbs="nano ~/.config/herbstluftwm/autostart"
