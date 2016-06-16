#!/bin/bash

export PATH=/bin:/usr/bin:/usr/local/bin

if [ $# -lt 4 ]
then
	echo "Usage: mysql_dump.sh DBNAME USERNAME PASSWD BACKUP_DIRECTORY"
	exit 1
fi

DBNAME=$1
DBUSER=$2
DBPASSWD=$3
DIR=$4

HOST=${HOST:-localhost}

opt="--single-transaction"


if [ ! -d $DIR ]
then
	mkdir -p $DIR
fi

DATE=`LANG=C date +%Y%m%d.%H%M%S`

if [ $DBPASSWD != "" ]
then
	passopt="-p$DBPASSWD"
fi
#mysqldump -h $HOST -u $DBUSER -B $DBNAME $passopt $opt | gzip -c > $DIR/$DBNAME.$DATE.backup.gz
mysqldump -h $HOST -u $DBUSER -B $DBNAME $passopt $opt > $DIR/$DBNAME.backup

