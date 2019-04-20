#!/bin/bash

CAMINHO_BACKUP=/home/renato/backup/backup_amazon
DATA=$(date +%F)
TABELAS=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)

cd $CAMINHO_BACKUP
if [ ! -d $DATA ]
then
	mkdir $DATA
fi

for TABELA in $TABELAS
do
	mysqldump -u root mutillidae $TABELA > $CAMINHO_BACKUP/$DATA/$TABELA.sql
done

aws s3 sync $CAMINHO_BACKUP s3://cursos-alura-shell


