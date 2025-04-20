module "vpc" {
  #source = "github.com/terraform-aws-modules/terraform-aws-vpc"
  #    version = "~> 3.0"
  source = ".."
  name   = "vpc"
}