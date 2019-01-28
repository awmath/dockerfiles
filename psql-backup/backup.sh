#!/bin/sh

# Storage folder where to move backup files
# Must contain backup.monthly backup.weekly backup.daily folders
storage=/backup
mkdir -p $storage/monthly
mkdir -p $storage/weekly
mkdir -p $storage/daily

# create database dump
if [ ! -f ~/.pgpass ]; then
    echo "$DBHOST:$DBPORT:$DBNAME:$DBUSER:$DBPASS" > ~/.pgpass
    chmod 600 ~/.pgpass
fi
pg_dump --clean --create --format=custom --blobs --verbose -f $storage/dump_current -h $DBHOST -p $DBPORT -U $DBUSER $DBNAME

# Destination file names
date_daily=`date +"%Y-%m-%d"`

# Get current month and week day number
month_day=`date +"%d"`
week_day=`date +"%u"`

# Optional check if source files exist. Email if failed.
#if [ ! -f $storage/dump_current ]; then
#ls -l $storage/ | mail nextcloud@sparse-space.de -s "backup script -- Daily backup failed! Please check for missing files."
#fi

# It is logical to run this script daily. We take files from source folder and move them to
# appropriate destination folder

# On first month day do
if [ "$month_day" -eq 1 ] ; then
      cp $storage/dump_current $storage/monthly/$date_daily
  fi
  # On saturdays do
  if [ "$week_day" -eq 6 ] ; then
        cp $storage/dump_current $storage/weekly/$date_daily
    fi
    # On any regular day do
    cp $storage/dump_current $storage/daily/$date_daily

    # daily - keep for 7 days
    find $storage/daily/ -maxdepth 1 -mtime +14 -type f -exec rm -rv {} \;

    # weekly - keep for 30 days
    find $storage/weekly/ -maxdepth 1 -mtime +60 -type f -exec rm -rv {} \;

    # monthly - keep for 300 days
    find $storage/monthly/ -maxdepth 1 -mtime +300 -type f -exec rm -rv {} \;

    rm $storage/dump_current
