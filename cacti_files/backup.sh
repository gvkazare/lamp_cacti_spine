#!/bin/bash
#this for reference only to create the backup scrips for each container ... the idea to use the same command for each container
#each container will have their own custum backup scritp for it ... 

echo "Start backup"

echo "=> MYSQL backup"
#Backup mysql
mysqldump -uroot --all-databases | gzip > /var/backups/cacti_db.gz

echo "=> hosts backup"
#Backup important file ... of the configuration ...
cp  /etc/hosts  /var/backups/

echo "=> RRA backup"
#Backup importand files relate to app
tar czf /var/backups/cacti_rra.tar.gz /opt/cacti/rra/*

echo "End backup"
