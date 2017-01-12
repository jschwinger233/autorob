# Auto-commit for 2017 Plan

ME=jschwinger23

MY_GITHUB=$(curl "https://github.com/$ME" --connect-timeout 3)
while [ "$?" != "0" ]; do
    MY_GITHUB=$(curl "https://github.com/$ME" --connect-timeout 3)
done

if [ "$DEBUG" == "1" ]; then
    echo $MY_GITHUB > github.ignore
fi

TODAY=$(date +%Y-%m-%d)
echo $MY_GITHUB | grep -q 'fill="#eeeeee" data-count="0" data-date="'$TODAY
if [ "$?" != "0" ]; then
    echo 'pushed already, congrats!'
    exit 0
fi

CUR_DIR=$(cd $(dirname $0); pwd)
echo -n ' ' >> $CUR_DIR/append.ignore
cd $CUR_DIR && git commit -am'auto-commit'
