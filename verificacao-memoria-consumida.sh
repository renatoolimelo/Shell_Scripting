#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total * 100" | awk -F. '{ print $1 }')

echo $relacao_memoria_atual_total

if [ $relacao_memoria_atual_total -gt 1 ]
then
	mail -s "Consumo de memória acima do limite" renato.olimelo@outlook.com<<del
	O consumo de memória está acima do limite que foi especificado.
	Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print $3 }')
del
fi

exit 0

