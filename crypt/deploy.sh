if [ -f /etc/redhat-release ]; then
    yum install gpg
else
    brew install gpg
fi

LOCAL_BIN=/usr/local/bin
if [ ! -d "$LOCAL_BIN" ]; then
    mkdir -p $LOCAL_BIN 
fi
cp *.sh $LOCAL_BIN
if [[ "$PATH" == *"$LOCAL_BIN"* ]]; then
    PATH=$PATH:$LOCAL_BIN
fi
chmod a+x $LOCAL_BIN/*.sh
