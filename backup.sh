#!/bin/bash

source_dir="$1"
destination_dir="/home/$USER/file_backup"

timestamp=$(date +%Y-%m-%d-%H:%M)
hostname=$(hostname -s)
archive_file="$hostname-backup-$timestamp.tgz"

color='\033[0;31m'
null='\033[0m'

if [ ! -d ~/file_backup ]; then
       mkdir ~/file_backup
fi       

if [ ! -d $source_dir ]; then
	echo "Please enter an existing directory!"
elif [ -z $source_dir ]; then
	echo "Please pass directory as argument!"
else
	printf "Backing up ${color}$source_dir ${null}to ${color}$destination_dir/$archive_file${null}\n"
	date
	echo -e "--------------------------------------------------------------------------------------------------"

	tar czfP $destination_dir/$archive_file $source_dir

	echo "Backup finished!"
	date
fi

find ~/file_backup -mtime +5 -exec rm {} \;
