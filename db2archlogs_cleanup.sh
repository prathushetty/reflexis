#!/bin/bash
#################################################################################
### Script to simulate cleanup of logs for testing purposes.
### Usage: sh db2archlogs_cleanup.sh <retention_days>
#################################################################################

# # Set retention period to 4 days if not provided
# if [ -z "$1" ]; then
#     Retention=4
# else
#     Retention=$1
# fi

# # Get hostname and date
# HOST_NAME=$(hostname | cut -d"." -f1)
# FILE_DATE=$(date +%Y-%m-%d)

# # Set up a base directory in the home directory for testing
# BASEDIR=~/test_db2archlogs_cleanup
# LOGGER=${BASEDIR}/${HOST_NAME}_${FILE_DATE}.log

# # Create base directory if it doesn't exist
# if [ ! -d "$BASEDIR" ]; then
#     mkdir -p $BASEDIR
# fi

# # Create a test log file to simulate the operation
# echo "Creating test files for cleanup..." >> $LOGGER
# touch $BASEDIR/testfile1.LOG
# touch $BASEDIR/testfile2.LOG.gz

# # Log the start of the cleanup process
# echo "Purging files older than ${Retention} days" >> $LOGGER
# echo "START purging: $(date)" >> $LOGGER

# # Simulate the cleanup operation
# find $BASEDIR -type f -name "*.LOG" -mtime +$Retention -exec rm -v {} \; >> $LOGGER
# find $BASEDIR -type f -name "*.LOG.gz" -mtime +$Retention -exec rm -v {} \; >> $LOGGER

# # Simulate cleanup of old log files in the same directory
# find $BASEDIR -type f -name "$HOST_NAME*.log" -mtime +2 -exec rm -v {} \; >> $LOGGER

# # Log the end of the cleanup process
# echo "END purging: $(date)" >> $LOGGER

# # Output the log for review
# cat $LOGGER


#/bin/bash
#################################################################################
### Script to clean up the /db2archlogs directory based on retentaion period
### passed as value.
### Usage sh db2archlogs_cleanup.sh value1
### Author: Prateek Kante, Reflexis Systems Inc.
#################################################################################

if [ -z "$1" ];then
Retention=4
else
Retention=$1
fi
HOST_NAME='hostname|cut -d"." -f1'
FILE_DATE='date +%Y-%m-%d'
BASEDIR=/C/ProgramData/Jenkins/.jenkins/workspace/test_db2archlogs_cleanup
LOGGER=${BASEDIR}/${HOST_NAME}_${FILE_DATE}.log

if [ ! -d "$BASEDIR" ]; then
    mkdir -p $BASEDIR
fi
echo "Purging less than ${Retention} days">>$LOGGER
echo "START purging :`date`">>$LOGGER
########################## db2archlogs Retention ###################################
find /C/ProgramData/Jenkins/.jenkins/workspace/db2archlogs1 -type f -name "S*.LOG" -mtime +$Retention -exec rm -v {} \; >>$LOGGER
find /C/ProgramData/Jenkins/.jenkins/workspace/db2archlogs1 -type f -name "S*.LOG".gz -mtime +$Retention -exec rm -v {} \; >>$LOGGER
find /C/ProgramData/Jenkins/.jenkins/workspace/dbbackups/logs/scripts/db2archlogs_cleanup -type f -name "$HOST_NAME*.log" -mtime +2 -exec rm -v {} \; >>$LOGGER
echo "END purging:`date`">>$LOGGER



