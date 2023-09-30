#!/bin/bash

find /bkp/backup -type f -exec chattr -i {} \;

sleep 1

backup_arquivos="/home/"
destino="/bkp/backup"

dia=$(date +%H-%M-%S-%d-%m-%y)
hostname=$(hostname -s)

arquivo="$hostname-$dia.tar.gz"

sleep 1

echo "Realizando o backup da /home"

sleep 1

tar -zcvf $destino/$arquivo $backup_arquivos

sleep 1

echo "Backup realizado com sucesso !"

find /bkp/backup -mtime +2 -delete
sleep 1

find /bkp/backup -type f -exec chattr +i {} \;
