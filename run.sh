#!/bin/bash
set -e
CONFIG_PATH=/data/options.json
SYSTEM_USER=/data/system_user.json

KEYFILE=$(jq --raw-output ".keyfile" $CONFIG_PATH)
CERTFILE=$(jq --raw-output ".certfile" $CONFIG_PATH)
REQUIRE_CERTIFICATE=$(jq --raw-output ".require_certificate" $CONFIG_PATH)
BOOK_PATH=$(jq --raw-output ".ebook_path" $CONFIG_PATH)
REQUIRE_USER=$(jq --raw-output ".require_user" $CONFIG_PATH)
USER_DB=$(jq --raw-output ".userdb" $CONFIG_PATH)
CALIBRE_SERVER=$(jq --raw-output ".start_calibre_server" $CONFIG_PATH)

if [ "$REQUIRE_CERTIFICATE" = true ]; then
	OPT_CERT="--ssl-certfile /ssl/$CERTFILE --ssl-keyfile /ssl/$KEYFILE"
else
	OPT_CERT=""
fi

if [ "$REQUIRE_USER" = true ]; then
	OPT_USER="--userdb $USER_DB --enable-auth"
else
	OPT_USER=""
fi
if [ "$CALIBRE_SERVER" = true ]; then
	echo calibre-server --enable-local-write $OPT_CERT $OPT_USER $BOOK_PATH
	calibre-server --enable-local-write $OPT_CERT $OPT_USER $BOOK_PATH &
fi
echo python /cw/cps.py -p /data/cw.db
python /cw/cps.py -p /data/cw.db