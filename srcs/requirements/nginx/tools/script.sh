
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=IT/L=Roma/O=42Roma/OU=student/CN=fbiondo.42.fr"

nginx -g "daemon off;"
