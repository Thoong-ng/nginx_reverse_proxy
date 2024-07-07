#!/bin/bash

set -e

# Read the previous image tag
PREVIOUS_TAG=$(cat ~/current_image_tag.txt)

# Pull the previous image
docker pull $DOCKERHUB_REPO:$PREVIOUS_TAG

# Stop and remove the current container
docker stop nginx-reverse-proxy || true
docker rm nginx-reverse-proxy || true

# Run the previous container
docker run -d --name nginx-reverse-proxy -p 80:80 $DOCKERHUB_REPO:$PREVIOUS_TAG

echo "Rolled back to image tag: $PREVIOUS_TAG"