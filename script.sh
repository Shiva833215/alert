#!/bin/bash


MEMORY_THRESHOLD=2
CPU_THRESHOLD=1

MEMORY_USAGE=$(free | awk 'NR==2{printf "%.2f", $3/$2*100}')
CPU_USAGE=$(mpstat | awk '$12 ~ /[0-9.]+/ {printf "%.2f", 100-$12}')

if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )) || (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "Threshold exceeded, sending email notification."
    echo -e "Resource Utilization Alert:\n\nCPU Utilization: ${CPU_USAGE}%\nMemory Utilization: ${MEMORY_USAGE}%\n\n"
else
    echo "Resource utilization is within acceptable limits."
fi
 
