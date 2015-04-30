script_location=`realpath $0`
script_dir=`dirname "$script_location"`

pushd "$script_dir"

docker-compose -f run.compose.yml -p vsftpd up -d

popd
