#!/bin/bash

CONFIG_FILE="/etc/nginx/api_servers.conf"

# Xóa file cũ nếu tồn tại
rm -f $CONFIG_FILE

# Lấy tất cả biến môi trường bắt đầu bằng API_SERVER_
for var in $(env | grep ^API_SERVER_ | cut -d= -f1); do
    echo "server ${!var};" >> $CONFIG_FILE
done

# Nếu không có server nào được cấu hình, thêm một server mặc định
if [ ! -s $CONFIG_FILE ]; then
    echo "server 127.0.0.1:8080;" >> $CONFIG_FILE
fi