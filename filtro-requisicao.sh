#!/bin/bash

PARAMETRO=$1

if [ -z $PARAMETRO ]
then
	while [ -z $PARAMETRO ]
	do	
		read -p "Você esqueceu de colocar o parâmetro (GET, PUT, POST, DELETE):" PARAMETRO
		LETRA_MAIUSCULA=$(echo $PARAMETRO | awk '{ print toupper($1) }')
	done
else
	LETRA_MAIUSCULA=$(echo $PARAMETRO | awk '{ print toupper($1) }')
fi

cd /home/apache-log

case $LETRA_MAIUSCULA in
	GET)
	cat apache.log | grep GET
	;;

	POST)
	cat apache.log | grep POST
	;;

	PUT)
	cat apache.log | grep PUT
	;;

	DELETE)
	cat apache.log | grep DELETE
	;;

	*)
	echo "O parâmetro passado não é válido"
	;;
esac

exit 0

