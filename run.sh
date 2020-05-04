#!/bin/bashio
set -e
bashio::log.info "Start"
mkdir -p /share/calibre
chmod -R 777 /share/calibre

declare ingress_interface
declare ingress_port
declare ingress_entry

ingress_port=$(bashio::addon.ingress_port)
ingress_interface=$(bashio::addon.ip_address)
ingress_entry=$(bashio::addon.ingress_entry)

CONFIG_PATH=/data/options.json
SYSTEM_USER=/data/system_user.json

PROXY_USER_HEADER=$(jq --raw-output ".proxy_user_header" $CONFIG_PATH)
PROXY_USER=$(jq --raw-output ".proxy_user" $CONFIG_PATH)
CALIBRE_SERVER=$(jq --raw-output ".start_calibre_server" $CONFIG_PATH)
BOOK_PATH=$(jq --raw-output ".ebook_path" $CONFIG_PATH)
REQUIRE_USER=$(jq --raw-output ".require_user" $CONFIG_PATH)
USER_DB=$(jq --raw-output ".userdb" $CONFIG_PATH)

sed -i "s/%%port%%/${ingress_port}/g" /etc/nginx.conf
sed -i "s/%%interface%%/${ingress_interface}/g" /etc/nginx.conf
sed -i "s#%%uri_prefix%%#${ingress_entry}#g" /etc/nginx.conf
sed -i "s/%%x_user%%/$PROXY_USER/g" /etc/nginx.conf
sed -i "s/%%x_header%%/$PROXY_USER_HEADER/g" /etc/nginx.conf




if [ "$REQUIRE_USER" = true ]; then
	OPT_USER="--userdb $USER_DB --enable-auth --auth-mode=basic"
else
	OPT_USER=""
fi

bashio::log.info "Starting Calibre Web..."
python /cw/cps.py -p /data/cw.db &


if [ "$CALIBRE_SERVER" = true ]; then
	bashio::log.info "Starting Calibre Server..."
	calibre-server --url-prefix ${ingress_entry} --port 8080 --enable-local-write $OPT_USER $BOOK_PATH &
fi

bashio::net.wait_for 8083
bashio::log.info "Starting NGinx..."
exec nginx -c /etc/nginx.conf < /dev/null