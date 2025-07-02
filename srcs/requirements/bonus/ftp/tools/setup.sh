#!/bin/sh
adduser -D "$FTP_USER"
echo "$FTP_USER:$FTP_PWD" | chpasswd
exec vsftpd /etc/vsftpd/vsftpd.conf
