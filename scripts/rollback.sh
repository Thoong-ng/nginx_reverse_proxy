#!/bin/bash

set -e

# Read the previous image tag
PREV_IMAGE_TAG=$(cat /tmp/current_image_tag)

# Stop and remove the current container
docker stop nginx-proxy || true
docker rm nginx-proxy || true

# Run the previous version
docker run -d --name nginx-proxy \
  -p 80:80 -p 443:443 \
  --restart always \
  $DOCKER_REPO:$PREV_IMAGE_TAG

echo "Rolled back to version $PREV_IMAGE_TAG"