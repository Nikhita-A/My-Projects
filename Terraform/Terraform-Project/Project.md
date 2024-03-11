Automated infrastructure in AWS using Terraform 
------------------------------------------------

### Tasks performed:

* Created a network architecture with VPC, Subnets, Internet Gateway and route tables
* Provisioned two EC2 instances in two availability zones, configuring them with the necessary security groups and network settings.
* Created and configured an Application Load Balancer with security groups
* Deployed index.html pages on each of the servers by configuring the user-data scripts
* Tested the configuration by accessing the ALB DNS url.
* Additionally, secured the Terraform State file as remote backend in the AWS S3 bucket so the only authorized IAM user or role can only access it.
