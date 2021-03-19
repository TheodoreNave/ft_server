echo "Set Autoindex to off ?"

read AUTOINDEX

if [ "$AUTOINDEX" = "off" ] ;
then
    echo "Autoindex is set to off ;)"
    rm -rf /etc/nginx/sites-available/localhost
    cp /tmp/nginxoff.conf /etc/nginx/sites-available/localhost
    service nginx restart
else
    echo "Autoindex is set to on :o"
fi
exit