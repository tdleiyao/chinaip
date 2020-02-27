#!/bin/sh

wget -c http://ftp.apnic.net/stats/apnic/delegated-apnic-latest

cat delegated-apnic-latest | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}'|cat >ip.txt

rm -rf delegated-apnic-latest
