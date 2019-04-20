#!/bin/bash

DATABASE=$1
CAMINHO_HOME=/home/renato
cd $CAMINHO_HOME

if [ ! -d backup ]
then
        mkdir backup
fi

mysqldump -u root $DATABASE > $CAMINHO_HOME/backup/$DATABASE.sql

if [ $? -eq 0 ]
then
        echo "Backup realizado com sucesso"
else    
        echo "Houve um problema no backup"
fi

