#!/bin/bash
# Script de proyecto AWS

LOG_DIR="/var/log/myapp"
echo "Iniciando limpieza de logs: $(date)" >> /home/ec2-user/mantenimiento.log

# Borrar logs de más de 7 días
find $LOG_DIR -name "*.log" -type f -mtime +7 -delete

# Programar en cron (ejecutar cada domingo a media noche)
# (crontab -l ; echo "0 0 * * 0 /home/ec2-user/mantenimiento.sh") | crontab -
