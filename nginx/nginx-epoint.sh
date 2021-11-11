#!/bin/bash

#mainFileName="$(ls /usr/share/nginx/html/main*.js)"
# for i in ${mainFileName}
#do
#       envsubst '$CLIENT_ID $SECRET_ID $TOKEN_ENDPOINT $GIS_ENDPOINT $ADMINISTRATIVE_ENDPOINT $INITIAL_LAYERS $MAX_LAYER_WARN $MAP_BACKGROUND $MAP_CENTER $MAP_ZOOM $MAP_MIN_ZOOM $MAP_MAX_ZOOM $MAP_EXTENT $WSO2_DISCOVERY $USER_CLIENT_ID $USER_SECRET_ID $LAYER_ENABLE_SEARCH $LAYER_ENABLE_S_STREET $LAYER_ENABLE_S_STREET_NUMBER $WSO2_ISSUER' < ${i} > main.tmp
#       mv main.tmp  ${i}
#done

cd /etc/nginx/conf.d/
#First start OR after env variable change (re-created wout volumes)
if [ ! -f default.conf ] ; then
[ ! -z "$override" ] && cp -f /default-override.conf default.conf || cp -f /default.conf default.conf
fi
cd -
bash /docker-entrypoint.sh nginx -g 'daemon off;'

