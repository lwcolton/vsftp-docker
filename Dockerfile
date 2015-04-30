FROM ubuntu:14.04

ADD /vsftpd-3.0.2.tar.gz /root

RUN apt-get update && apt-get -y install build-essential

RUN mkdir /usr/local/man/man8 /usr/local/man/man5

RUN cd /root/vsftpd-3.0.2 && make && make install

CMD ["/usr/local/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
