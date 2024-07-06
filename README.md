# Nginx Reverse Proxy CI/CD Project

This project sets up a CI/CD pipeline using GitHub Actions to deploy an Nginx server as a reverse proxy and load balancer for AI API services on AWS Cloud.

## Features

- Automated deployment using GitHub Actions
- HTTPS support
- Docker containerization
- Automatic rollback on deployment failure
- Load balancing for multiple AI API servers

## Setup

1. Fork this repository
2. Set up the following secrets in your GitHub repository:
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY
   - AWS_REGION
   - DOCKERHUB_USERNAME
   - DOCKERHUB_TOKEN
   - DOCKER_REPO
   - EC2_HOST
   - EC2_USERNAME
   - SSH_PRIVATE_KEY
3. Configure your AI API server addresses in `nginx/nginx.conf`
4. Add your SSL certificates (`fullchain.pem` and `privkey.pem`) to the `nginx` directory
5. Push changes to the `main` branch to trigger the deployment

## Manual Deployment

You can also deploy manually using Docker Compose: