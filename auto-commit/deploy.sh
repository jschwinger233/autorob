set -x

CUR_DIR=$(cd $(dirname $0); pwd)
cp $CUR_DIR/auto-commit.sh /etc/cron.daily/
chmod a+x /etc/cron.daily/auto-commit.sh

cat <<EOF >> /var/spool/cron/root
30 23 * * * /bin/bash $CUR_DIR/auto-commit.sh
EOF
