
FROM debian:12

RUN apt update && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=JO/ST=JOR/L=Irbid/O=42/CN=fadarwis.42.fr"
    
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]
