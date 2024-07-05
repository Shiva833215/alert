#!/bin/bash


MEMORY_THRESHOLD=2
CPU_THRESHOLD=1

MEMORY_USAGE=$(free | awk 'NR==2{printf "%.2f", $3/$2*100}')
CPU_USAGE=$(mpstat | awk '$12 ~ /[0-9.]+/ {printf "%.2f", 100-$12}')

if (( $(echo "$MEMORY_USAGE >= $MEMORY_THRESHOLD" | bc -l) )); then
    echo "Memory usage is high: $MEMORY_USAGE%" 
fi

if (( $(echo "$CPU_USAGE >= $CPU_THRESHOLD" | bc -l) )); then
    echo "CPU usage is high: $CPU_USAGE%"
fi
