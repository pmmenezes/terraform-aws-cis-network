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
  default     = "my-vpc" # Change this to your desired VPC name
}

variable "tags" {
  description = "Tags to apply to the VPC"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "my-project"
  }
}