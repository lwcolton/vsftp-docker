if [ "$(id -u)" != "0" ]; then
    echo "Must be run as root"
    exit 1
fi

if [ -z "$SUDO_USER" ]; then
	echo "You need to use sudo to run this"
	exit 1
fi

apt-get update && apt-get -y install curl python3 realpath

if which docker > /dev/null; then
	echo "Docker exists, skipping"
else
	curl -L https://get.docker.com | /bin/sh
fi

script_location=`realpath $0`

script_dir=`dirname "$script_location"`

python3 "$script_dir"/get-pip.py

pip3 install docker-compose

usermod -aG docker "$SUDO_USER"
