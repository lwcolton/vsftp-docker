FROM ubuntu:14.04

ADD /vsftpd-3.0.2.tar.gz /root

RUN apt-get update && apt-get -y install build-essential

RUN mkdir /usr/local/man/man8 /usr/local/man/man5 /usr/share/empty /var/ftp

RUN cd /root/vsftpd-3.0.2 && make && make install

RUN useradd -d /var/ftp ftp && chown root:root /var/ftp && chmod og-w /var/ftp

COPY /vsftpd.conf /etc/vsftpd.conf

CMD ["/usr/local/sbin/vsftpd", "/etc/vsftpd.conf"]
