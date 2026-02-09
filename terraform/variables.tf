variable "aws_region" {
  description = "Region name"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t3.micro"
}

variable "ami_id" {
    description = "EC2 Image ID"
    type = string
    default = "ami-0b6c6ebed2801a5cb"
}

variable "instance_name" {
  description = "EC2 instance name"
  type = string
  default = "web01"
}