script_location=`realpath $0`
script_dir=`dirname "$script_location"`

if [ -z "$BASH_VERSION" ]; then
    echo "Must be run with bash"
    exit 1
fi

pushd "$script_dir"

docker build -t vsftpd .
docker rm -f vsftp_server || true
docker run -d --restart always --name vsftp_server -p 20:20 -p 21:21 -p 65525-65535:65525-65535 -v /var/ftp:/var/ftp vsftpd

#docker-compose -f run.compose.yml -p vsftpd up -d

popd
