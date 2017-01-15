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
echo $MY_GITHUB | grep -Pq 'data-count="(?!0)[^"]+" data-date="'$TODAY
if [ $? -eq 0 ]; then
    echo 'pushed already, congrats!'
    exit 0
fi

echo 'busy day, push now!'
CUR_DIR=$(cd $(dirname $0); pwd)

NOW=$(date +%Y-%m-%dT%H:%M:%S)
echo $NOW >> $CUR_DIR/append
cd $CUR_DIR && git commit -am'auto-commit'$NOW && git push origin master
