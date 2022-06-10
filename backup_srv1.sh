#!/bin/bash

backup_folder="/mnt/REMOTED_FOLDERS/SRV1_DATA2"
backup_to_directory="/mnt/BACKUP_DAYS/BACKUP"
backup_log_file="/mnt/BACKUP_LOG/log.txt"
backup_folder_years="/mnt/BACKUP_YEARS/BACKUPS_YEARS"

ybackup=$(date +"%Y")
mbackup=$(date +"%m")
dbackup=$(date +"%d")
dnbackup=$(date +"%d-%m-%Y(%H-%M)")
dirbackup=$backup_to_directory/$mbackup.$ybackup

echo "Резервное копирование $backup_folder начато!"
echo "Резервное копирование $backup_folder начато $dnbackup" >> $backup_log_file

if [ ! -d "$dirbackup" ]; then
mkdir -p $dirbackup
echo "Создана новая директория" >> $backup_log_file
fi

zip -r -9 $dirbackup/BACKUP_SRV1_$dnbackup.zip $backup_folder/arm $backup_folder/asup $backup_folder/debitor $backup_folder/ogm

if [ $dbackup -eq 01 ]; then
mkdir -p $backup_folder_years/$ybackup/$mbackup/
cp $dirbackup/BACKUP_SRV1_$dnbackup.zip $backup_folder_years/$ybackup/$mbackup/ -v
echo "Резервная копия скопирована в годовые копии" >> $backup_log_file
fi

dkbackup=$(date +"%d-%m-%Y(%H-%M)")
echo "Резервное копирование $backup_folder завершено $dkbackup" >> $backup_log_file
echo "Резервное копирование $backup_folder завершено!"
