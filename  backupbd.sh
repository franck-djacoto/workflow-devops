#!/bin/bash

backup_dir=$(date +'%m-%d-%Y-%H-%M')
echo "Backup Database  today: /nas04/backups/${backup_dir}"
docker exec thetiptop-db /usr/bin/mysqldump -u root -proot -h127.0.0.1 --no-tablespaces  thetiptop  >  backupbdpro${backup_dir}.sql

#docker exec thetiptop-dbtest /usr/bin/mysqldump -u root -proot -h127.0.0.1 --no-tablespaces  thetiptoptest  > backupbdpreprod.sql
