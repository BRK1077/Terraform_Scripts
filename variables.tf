variable "env" {
  description = "The environment for deployment"
  default     = "DEV"
}

variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.7.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.7.1.0/24", "10.7.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.7.3.0/24", "10.7.4.0/24", "10.7.5.0/24", "10.7.6.0/24"]
}
