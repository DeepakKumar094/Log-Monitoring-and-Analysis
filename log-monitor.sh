#!/bin/bash

# Check if the log file path was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_log_file>"
    exit 1
fi

# Variables
LOG_FILE="$1"
LOG_MONITOR_FILE="log-monitor.log"
PATTERNS=("ERROR" "DEBUG" "404 Not Found" "500 Internal Server Error")
declare -A COUNTS=( ["ERROR"]=0 ["DEBUG"]=0 ["404 Not Found"]=0 ["500 Internal Server Error"]=0 )

# Function to log messages to log-monitor.log
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_MONITOR_FILE
}

# Function to clean up on script exit
cleanup() {
    log_message "Monitoring interrupted by user."
    echo -e "\nMonitoring stopped by user."
    for key in "${!COUNTS[@]}"; do
        echo "Total occurrences of '$key': ${COUNTS[$key]}"
    done
    exit 0
}

# Register the cleanup function to handle interruptions (Ctrl+C)
trap cleanup SIGINT

tail -f "$LOG_FILE" | while read -r line
do
    echo "Reading line: $line"  # Debug: Print each line being read
    for pattern in "${PATTERNS[@]}"
    do
        if echo "$line" | grep -iq "$pattern"; then
            ((COUNTS[$pattern]++))
            log_message "Match found for $pattern: $line"
        fi
    done
done

