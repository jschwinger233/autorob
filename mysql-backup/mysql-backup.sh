if [[ -z "$USER" ]] | [[ -z "$PASSWD" ]] | [[ -z "$DB" ]] | [[ -z "$TB" ]]; then
    echo "env USER / PASSWD / DB / TB shall be set properly!"
    exit
fi
TODAY=$(date +%Y-%m-%d)
CUR_DIR=$(cd $(dirname $0); pwd)
BAK="$CUR_DIR/$DB.$TB"
mysqldump -u"$USER" -p"$PASSWD" "$DB" "$TB" > "$BAK"
crypt.sh "$BAK" "$PASSWD" && rm -f $BAK
git add "$BAK.gpg" && git commit -m "backup MySQL $DB.$TB at $TODAY" && git push 
