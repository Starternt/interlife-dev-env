#!/bin/sh

test $MINIO_HOST || MINIO_HOST=localhost
test $MINIO_PORT || MINIO_PORT=9000
test $MINIO_ACCESS_KEY || MINIO_ACCESS_KEY=minio
test $MINIO_SECRET_KEY || MINIO_SECRET_KEY=minio
test $MINIO_BUCKET || MINIO_BUCKET=interlife
test $MINIO_PRIVATE_BUCKET || MINIO_PRIVATE_BUCKET=private-data

MINIO_ADDRESS="http://$MINIO_HOST:$MINIO_PORT"

function show_error() {
		local message="$1"; local funcname="$2"; local log_date=`date '+%Y/%m/%d:%H:%M:%S %Z'`
		echo -e "[ERROR.$funcname $log_date] $message" >&2
		err=1
}

function show_notice() {
		local message="$1"; local funcname="$2"; local log_date=`date '+%Y/%m/%d:%H:%M:%S %Z'`
		echo -e "[NOTICE.$funcname $log_date] $message"
}

function minio_wait() {
    echo 'Wait minio to start up...'
    while ! nc -z $MINIO_HOST $MINIO_PORT; do echo 'Wait minio to start up...' && sleep 0.1; done;
    sleep 5
}

function minio_init() {
    echo "Configure Minio client"
	mc config host add interlife $MINIO_ADDRESS $MINIO_ACCESS_KEY $MINIO_SECRET_KEY

	echo "Create bucket"
	mc mb interlife/$MINIO_BUCKET

    echo "Setup bucket policy"
	mc policy download interlife/$MINIO_BUCKET

	echo "Create private bucket"
	mc mb interlife/$MINIO_PRIVATE_BUCKET
}

minio_wait
minio_init
