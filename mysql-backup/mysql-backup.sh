TODAY=$(date +%Y-%m-%d)
CUR_DIR=$(cd $(dirname $0); pwd)
BAK="$CUR_DIR/$DB.$TB.bak"
mysqldump -u"$USER" -p"$PASSWD" "$DB" "$TB" > "$BAK"
git add $BAK && git commit -m "backup at $TODAY" && git push 
