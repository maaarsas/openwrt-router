#!/bin/sh
# Run on the router from a checkout of this repo.

REPO=$(cd -- "$(dirname -- "$0")" && pwd)

. /etc/openwrt-router.env

uci -c "$REPO/config" show >/dev/null || exit 1

for f in "$REPO"/config/*; do
  sed -e "s|@wifi_ssid@|$WIFI_SSID|" -e "s|@wifi_key@|$WIFI_KEY|" \
      -e "s|@iot_ssid@|$IOT_SSID|" -e "s|@iot_key@|$IOT_KEY|" \
      "$f" > "/etc/config/$(basename "$f")"
done

reload_config
