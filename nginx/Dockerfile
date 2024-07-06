FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/letsencrypt/live/yourdomain.com
COPY fullchain.pem /etc/letsencrypt/live/yourdomain.com/
COPY privkey.pem /etc/letsencrypt/live/yourdomain.com/

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]