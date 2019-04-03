# maheshbisl/cloudformation-lamj-stack
CloudFormation templates to deploy a LAMJ: Linux, Apache, MySQL and JSP based Webserver 

# Author: Mahesh Bisl

## Problem
Provide a Cloud formation template defining a redundant, secure and cost effective LAMJ stack within AWS.

## Completed Tasks:
* Provide a small application that will run on the infrastructure written in JSP
* Export the DNSes of MySQL and the Load balancer to the server
* Deploy the following using CloudFromation templates in an AWS account:
  * Networking (sceptre/templates/vpc.yaml)
    * VPC (Virtual Private Cloud)
    * Private Subnets - Servers and RDS are deployed here
    * Public Subnets - Load balancer is deployed here
    * Internet Gateway
    * NAT Gateway
    * Routing Tables
  * Load Balancing (sceptre/templates/alb.yaml)
    * Application Load Balancer
    * Default Target Group
  * MySQL DB (sceptre/templates/rds.yaml)
    * MySQL RDS
  * Auto Scaling (sceptre/templates/asg.yaml)
    * Auto Scaling Group - provide 'AutoScalingRollingUpdate'
* Use [Sceptre](https://sceptre.cloudreach.com/latest/about.html) to deploy CloudFormation templates.
* Build an AMI for stable and uniform platform using [Packer](https://www.packer.io/intro/why.html)
* Provide CI/CD using [CircleCi](https://circleci.com/gh/maheshbisl/cloudformation-lamj-stack/tree/master)
  * CircleCI configuration (.circleci/config.yaml)
  * [Need to set AWS credential in CircleCI to run this](https://discuss.circleci.com/t/aws-cli-keys-after-august-31st/23060/4)
* Provide Shell Scripts:
  * install.sh - install dependencies to build and deploy
  * build-deploy.sh - build the war, packer based AMI and deploy CloudFormation stacks using sceptre
  
## TODO Tasks
* Server connects to the MySQL database
