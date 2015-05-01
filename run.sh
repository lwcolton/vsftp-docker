script_location=`realpath $0`
script_dir=`dirname "$script_location"`

if [ -z "$BASH_VERSION" ]; then
    echo "Must be run with bash"
    exit 1
fi

pushd "$script_dir"

docker-compose -f run.compose.yml -p vsftpd up -d

popd
