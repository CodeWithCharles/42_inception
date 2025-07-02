FROM alpine:3.18
RUN apk add --no-cache vsftpd
COPY tools/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh
EXPOSE 21 10090-10100
CMD ["/setup.sh"]
