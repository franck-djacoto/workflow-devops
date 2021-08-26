#!/bin/bash

backup_dir=$(date +'%m-%d-%Y-%H-%M')


if [ $1 == 'develop' ]
   then
    echo "Backup Database  today: /nas04/backups/${backup_dir}"
    docker exec thetiptop-db /usr/bin/mysqldump -u root -proot -h127.0.0.1 --no-tablespaces  thetiptop  >  BackupDB/backupbdpredpro${backup_dir}.sql
     echo "Database PreProd  save successfully...."
fi

if [ $1 == 'prod' ]
   then
    echo "Backup Database  today: /nas04/backups/${backup_dir}"
    docker exec thetiptop-dbtest  /usr/bin/mysqldump -u root -proot -h127.0.0.1 --no-tablespaces  thetiptoptest  >  BackupDB/backupbdpro${backup_dir}.sql
    echo "Database Prod  save successfully...."
fi