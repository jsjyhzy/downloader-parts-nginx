envsubst "$(env | sed -e 's/=.*//' -e 's/^/\$/g')" < server.template > server
cp -n server /config/server
ln -s /config/server /etc/nginx/sites-enabled
rm /etc/nginx/sites-enabled/default
nginx -g 'daemon off;'