# gpg required
# run with sudo

LOCAL_BIN=/usr/local/bin
if [ ! -d "$LOCAL_BIN" ]; then
    mkdir -p $LOCAL_BIN 
fi
cp *.sh $LOCAL_BIN
if [[ "$PATH" == *"$LOCAL_BIN"* ]]; then
    PATH=$PATH:$LOCAL_BIN
fi
chmod a+x $LOCAL_BIN/*.sh
