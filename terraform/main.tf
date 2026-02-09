provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "web01_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group - ssh from my ip & HTTP open"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_from_ip" {
  security_group_id = aws_security_group.web01_sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "143.105.152.197/32"
}

resource "aws_vpc_security_group_ingress_rule" "http_open" {
  security_group_id = aws_security_group.web01_sg.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web01_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}

resource "aws_key_pair" "web01_key_pair" {
  key_name   = "web01-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "web_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web01_sg.id]
  key_name = aws_key_pair.web01_key_pair.key_name

  tags = {
    Name = var.instance_name
  }
}