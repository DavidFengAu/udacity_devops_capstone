# Udacity Cloud DevOps Nanodegree

## Project Overview

In this project I apply the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:

- Working in AWS
- Using Jenkins to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Working with Ansible and CloudFormation to deploy clusters
- Building Kubernetes clusters
- Building Docker containers in pipelines

### Application

The application is a simple static site running in the nginx container and exposing port 80.

## How to Deploy

1. Create an EC2 Instance with Jenkins, aws-cli, Docker & kubectl installed.

2. Create an AWS EKS Cluster and node group 
`./create-cluster.sh`.

3. Create Docker file
`see Dockerfile`.

4. Create the rolling deployment pipeline
`see Jenkinsfile`.

### Rolling update

I implemented rolling updates within kubernetes, which allows it to update
pods without downtime. 
