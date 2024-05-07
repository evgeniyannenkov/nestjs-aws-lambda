# NestJS Server on AWS Lambda

This repository contains a Terraform configuration example for deploying a NestJS server on AWS Lambda, using container images for packaging and API Gateway for public accessibility.

## Overview

The project sets up a NestJS application to run as a serverless function within AWS Lambda. This approach allows the NestJS application to benefit from the scalability and cost-efficiency of serverless architecture. The server is packaged into a Docker container image, which is then deployed to Lambda. An API Gateway is configured to create a publicly accessible route to the server.

## Prerequisites

Before you begin, ensure you have the following installed:
- [Node.js](https://nodejs.org/)
- [Docker](https://www.docker.com/)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Terraform](https://www.terraform.io/downloads.html)

Additionally, you need:
- An AWS account with appropriate permissions to manage Lambda, API Gateway, and other required services.
- Configured AWS credentials on your machine or CI/CD environment.

## Setup

### 1. Clone the Repository

Start by cloning this repository to your local machine:

```bash
git clone https://github.com/evgeniyannenkov/nestjs-aws-lambda.git nestjs-aws-lambda
cd nestjs-aws-lambda
```

### 2. Deploy Using Terraform
```bash
cd infrastructure
terraform init
terraform apply
```