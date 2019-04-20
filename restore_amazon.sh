#/bin/bash

CAMINHO_RESTORE=/home/renato/backup/restore_amazon
DATA=$(date +%F)

aws s3 sync s3://cursos-alura-shell/$DATA $CAMINHO_RESTORE

cd $CAMINHO_RESTORE

for ARQUIVOS in *.sql
do
	mysql -u root mutillidae < $ARQUIVOS
	if [ $? -eq 0 ]
	then
		echo "O restore da tabela $ARQUIVOS  realizado com sucesso"
	else
		echo "Falha no restore da tabela $ARQUIVOS"
	fi
done

