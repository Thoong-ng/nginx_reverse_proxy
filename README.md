# Nginx Reverse Proxy for AI API Services

This project sets up a CI/CD pipeline using GitHub Actions to deploy an Nginx server on AWS EC2. The Nginx server acts as a reverse proxy and load balancer for multiple AI API services running on AWS Cloud.

## Features

- Automated build and deployment using GitHub Actions
- Docker containerization for easy deployment and scaling
- Nginx configuration for reverse proxy and load balancing
- Automatic rollback in case of deployment failures

## Prerequisites

- AWS account with EC2 instance set up
- DockerHub account
- GitHub repository

## Setup

1. Fork this repository
2. Set up the following secrets in your GitHub repository:
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY
   - EC2_PRIVATE_KEY
   - EC2_HOST
   - DOCKERHUB_USERNAME
   - DOCKERHUB_TOKEN

3. Update the `nginx.conf` file with your AI API server addresses
4. Push changes to the `main` branch to trigger the deployment

## Deployment

The CI/CD pipeline will automatically:
1. Build the Docker image
2. Push the image to DockerHub
3. Deploy the new image to your EC2 instance
4. Rollback to the previous version if deployment fails

## Maintenance

To update the Nginx configuration or add/remove AI API servers, simply modify the `nginx.conf` file and push the changes to the `main` branch. The CI/CD pipeline will handle the rest.