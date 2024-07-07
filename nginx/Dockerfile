FROM nginx:latest

RUN apt-get update && apt-get install -y bash

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY scripts/generate_api_servers.sh /generate_api_servers.sh
RUN chmod +x /generate_api_servers.sh

EXPOSE 80

CMD ["/bin/bash", "-c", "/generate_api_servers.sh && nginx -g 'daemon off;'"]