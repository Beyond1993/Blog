#!/bin/bash
while sleep 10
do
mysqldump -u root -p8111249 blog > ./blogbackup.sql
sudo git add .
sudo git commit -m "timer commit"
git push origin master
done
