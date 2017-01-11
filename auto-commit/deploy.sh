set -x

CUR_DIR=$(cd $(dirname $0); pwd)
mv $CUR_DIR/auto-commit.sh /etc/cron.daily/
