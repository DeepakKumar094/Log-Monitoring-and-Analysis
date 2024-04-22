# Log-Monitoring-and-Analysis0
                                                                                      README.md for log-monitor.sh
# Log Monitoring and Analysis Script
## Overview
This Bash script is designed to monitor a specified log file
in real-time and analyze its entries for predefined patterns
such as "ERROR", "DEBUG", and HTTP status codes like "404 Not
Found" and "500 Internal Server Error". It provides real-time
alerts and accumulates counts of each pattern, logging signif
icant findings for further review.
## Prerequisites
- A Linux-based system with Bash, `grep`, and `tail` installe
d.
- Read and write permissions in the directory where the scrip
t and log file are located.
## Installation
1. **Download the Script**
 - Download `log-monitor.sh` to your local system in a dire
ctory of your choice.

2. **Make the Script Executable**
 - Navigate to the directory where you've saved `log-monito
r.sh`.
 - Run the following command to make the script executable:
 ```bash
 chmod +x log-monitor.sh
 ```
 
## Usage
To start monitoring a log file, run the script with the path
to the log file as an argument:
Untitled 2
```bash
./log-monitor.sh /path/to/your/logfile.log


Real-time Monitoring and Analysis
The script will begin monitoring the specified log file for new entries.
It checks each new line for the specified patterns and logs any matches found.
The running count of each pattern's occurrences is maintained and will be
displayed if the monitoring is interrupted or stopped.
Stopping the Script


To stop the script, press Ctrl+C . This interruption is handled gracefully,
logging the stop action and displaying the total counts of each pattern found
during the session.

Log File
All significant events and matches are logged to log-monitor.log in the same
directory as the script. This includes each match found and a timestamp of
when the monitoring was stopped.


Expected Output
Upon stopping the script with Ctrl+C , you'll see an output similar to the following:
Monitoring stopped by user.
Total occurrences of 'ERROR': 3
Total occurrences of 'DEBUG': 5
Total occurrences of '500 Internal Server Error': 2
Total occurrences of '404 Not Found': 1
This output summaries the counts of each pattern found during the monitoring
session

Notes
Ensure that the log file exists and is being updated regularly for the script to
function effectively.
The script performs case-insensitive pattern matching to ensure it captures
variations in log entry formats
