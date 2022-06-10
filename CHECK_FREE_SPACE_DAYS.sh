#!/bin/bash
BACKUP_FOLDER="/mnt/BACKUP_DAYS/BACKUP"
backup_log_file="/mnt/BACKUP_LOG/log.txt"

INF=`df -hk | grep -i sdc1`
if [ -z "$INF" ]; then
AVAL="0"
else
AVAL=`echo $INF | awk {'print $4'}`
fi

if [ $AVAL -lt 70000000 ]; then
RESULT=$(cd $BACKUP_FOLDER && ls -1rt | head -1)
BACKUP_FULL_PATH=$BACKUP_FOLDER/$RESULT
rm -rf $BACKUP_FULL_PATH
echo "-----------------------------------------------------------------------------------------------------" >> $backup_log_file
echo "Удалена директория $BACKUP_FULL_PATH" >> $backup_log_file
echo "-----------------------------------------------------------------------------------------------------" >> $backup_log_file
fi
