#!/bin/bashё

LOG_FILE=/mnt/data/result_log

# Получаем IP клиента
client_ip=$(who -u | grep admin | awk '{print $NF}' | sed 's/[()]//g')

if [[ "$USER" == "admin" ]]; then
    session_pid=$(ps -o pid= -p $(ps -o ppid= -p $$))
    kill -9 $session_pid
fi

echo "$client_ip:" > $LOG_FILE
nohup nmap $client_ip  > $LOG_FILE &

exit 0