#!/bin/bash
set -e
CONFIG_PATH=/data/options.json
SYSTEM_USER=/data/system_user.json

BOOK_PATH=$(jq --raw-output ".ebook_path" $CONFIG_PATH)
REQUIRE_USER=$(jq --raw-output ".require_user" $CONFIG_PATH)
USER_DB=$(jq --raw-output ".userdb" $CONFIG_PATH)
CALIBRE_WEB=$(jq --raw-output ".start_calibre_web" $CONFIG_PATH)

if [ "$REQUIRE_USER" = true ]; then
	OPT_USER="--userdb $USER_DB --enable-auth --auth-mode=basic"
else
	OPT_USER=""
fi

if [ "$CALIBRE_WEB" = true ]; then
	echo python /cw/cps.py -p /data/cw.db
	python /cw/cps.py -p /data/cw.db &
fi
echo calibre-server --enable-local-write $OPT_USER $BOOK_PATH
calibre-server --enable-local-write $OPT_USER $BOOK_PATH


