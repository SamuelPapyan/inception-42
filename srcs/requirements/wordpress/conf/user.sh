wp core install --url=localhost --title="spapyan | inception" --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}
if wp user get Johnik >/dev/null 2>&1; then
    echo "User Johnik exists."
else
   wp user create ${WP_USR} ${WP_EMAIL} --role=subscriber --user_pass=${WP_PWD}
fi
#wp user update "spapyan" --user_pass="${WP_PWD}" --skip-email
if wp user get "spapyan" >/dev/null 2>&1; then
    echo "Logged in successfully as root."
else
    echo "Login failed. Please check your root credentials."
fi
wp theme install astra --activate
wp theme install https://downloads.brainstormforce.com/astra/astra.zip --active
wp theme install https://github.com/brainstormforce/astra/archive/master.zip --activate
/usr/sbin/php-fpm8 -F
