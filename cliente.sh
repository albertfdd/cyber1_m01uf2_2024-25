#!/usr/bin/bash
#################CLIENTE#################

echo "LSTP Cliente (Lecuga Transfer Protocol)"

echo "1. SEND HEADER"

echo  "LSTP_1" | nc localhost 7777
#

echo "2. LISTENER OK_HEADER"

DATA=`nc -l 7777`

echo "6. CHECK OK_HEADER"

if [ $DATA != "OK_HEADER" ]
then 

	echo "ERROR 1: Header enviado de forma erronea"
	
	exit 1
fi

#cat client/saludo.txt | text2wave -o client/saludo.ogg

#yes | ffmpeg -i cliente/saludo.wav client/saludo.ogg

echo "7. SEND FILE_NAME"

echo "FILE_NAME saludo.ogg" | nc localhost 7777

