vsftpd docker image
--------------------

##Get the project
```shell
sudo apt-get install git
git clone https://github.com/lwcolton/vsftp-docker.git
```

##Configure
You must first change the `pasv_address` setting in vsftpd.conf to be the external IP of the machine you are running this on.

##Install and Run

```shell
sudo ./install.sh
./run.sh
```

That's it!
