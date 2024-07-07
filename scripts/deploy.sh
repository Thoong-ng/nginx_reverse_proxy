#!/bin/bash

set -e

# Pull the latest image
docker pull $DOCKERHUB_REPO:$IMAGE_TAG

# Stop and remove the old container if it exists
docker stop nginx-reverse-proxy || true
docker rm nginx-reverse-proxy || true

# Run the new container
docker run -d --name nginx-reverse-proxy \
  -p 80:80 \
  -e API_SERVER_1_IP=${API_SERVER_1_IP} \
  -e API_SERVER_2_IP=${API_SERVER_2_IP} \
  -e API_SERVER_3_IP=${API_SERVER_3_IP} \
  $DOCKERHUB_REPO:$IMAGE_TAG

# Save the current image tag for potential rollback
echo $IMAGE_TAG > ~/current_image_tag.txt