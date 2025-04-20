## VPC variables
# This file contains the variables used in the VPC module.
variable "aws_region" {
  description = "The AWS region to deploy the resources in"
  type        = string
  default     = "us-east-1" # Change this to your desired region    
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "172.31.0.0/16" # Change this to your desired CIDR block
}
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "aws-csi-lab" # Change this to your desired VPC name
}

variable "default_tags" {
  description = "Default tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "aws-csi"
    Audit       = "true"
  }

}
## Subnet variables
# This file contains the variables used in the subnet module.
