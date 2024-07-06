#!/bin/bash

set -e

# Pull the latest image
docker pull $DOCKER_REPO:$IMAGE_TAG

# Stop and remove the current container
docker stop nginx-proxy || true
docker rm nginx-proxy || true

# Run the new container
docker run -d --name nginx-proxy \
  -p 80:80 -p 443:443 \
  --restart always \
  $DOCKER_REPO:$IMAGE_TAG

# Save the current image tag for potential rollback
echo $IMAGE_TAG > /tmp/current_image_tag