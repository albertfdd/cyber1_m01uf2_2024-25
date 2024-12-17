#!/usr/bin/bash
#################CLIENTE#################

IP_SERVIDOR=localhost
PORT=7777

echo "LSTP Cliente (Lecuga Transfer Protocol)"

echo "1. SEND HEADER"

echo  "LSTP_1" | nc $IP_SERVIDOR $PORT
#

echo "2. LISTENER OK_HEADER"

DATA=`nc -l $PORT`

echo "6. CHECK OK_HEADER"

if [ $DATA != "OK_HEADER" ]
then 

	echo "ERROR 1: Header enviado de forma erronea"
	
	exit 1
fi

#cat client/saludo.txt | text2wave -o client/saludo.ogg

#yes | ffmpeg -i cliente/saludo.wav client/saludo.ogg

echo "7. SEND FILE_NAME"

echo "FILE_NAME saludo.ogg" | nc $IP_SERVIDOR $PORT


PREFIX=`echo $DATA | cut -d " " -f 1`


echo "8. LISTEN"
DATA=`nc -l $PORT`

if [ "$DATA" != "OK_FILE_NAME" ]
then
	
	echo "ERROR 2: FILE_NAME error en el envio"
	exit 2

fi

echo "12. SEND FILE DATA"
cat saludo.ogg | nc $IP_SERVIDOR $PORT  

echo "13. LISTEN OK/KO_FILE_DATA"

DATA= `nc -l $PORT`

if [ "$DATA" != "OK_FILE_DATA" ]
then
	echo "ERROR 3: Error al enviar los datos
	exit 3"

fi

echo "Fin"
exit 0
