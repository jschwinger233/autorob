# Auto-commit for 2017 Plan

ME=jschwinger23
TODAY=$(date +%Y-%m-%d)

MY_GITHUB=$(curl "https://github.com/$ME" --connect-timeout 3)
while [ "$?" != "0" ]; do
    MY_GITHUB=$(curl "https://github.com/$ME" --connect-timeout 3)
done
echo $MY_GITHUB > github.html

echo $MY_GITHUB | grep 'data-date="'$TODAY'"' | grep -q '#eeeeee'
if [ "$?" != "0" ]; then
    exit
fi

CUR_DIR=$(cd $(dirname $0); pwd)
sed -i '$s/\(.*\)/\1 /' $0    
cd $CUR_DIR && git commit -am'auto-commit'

