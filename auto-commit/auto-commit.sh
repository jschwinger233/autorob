#!/bin/bash
# Auto-commit for 2017 Plan

ME=jschwinger23
TODAY=$(date +%Y-%m-%d)
NOW=$(date +%Y-%m-%dT%H:%M:%S)
CUR_DIR=$(cd $(dirname $0); pwd)
TIMEOUT=5

exec 3>$CUR_DIR/append

MY_GITHUB=$(curl "https://github.com/$ME" --connect-timeout $TIMEOUT)
while [ "$?" != "0" ]; do
    MY_GITHUB=$(curl "https://github.com/$ME" --connect-timeout $TIMEOUT)
done

if [ "$DEBUG" == "1" ]; then
    echo $MY_GITHUB > github.ignore
fi

echo $MY_GITHUB | grep -Pq 'data-count="(?!0)[^"]+" data-date="'$TODAY
if [ $? -eq 0 ]; then
    echo $NOW':pushed already, congrats!' >&3
    exit 0
fi

echo $NOW':busy day, push now!' >&3
cd $CUR_DIR && git commit -am'auto-commit'$NOW && git push origin master
exec 3>&-
