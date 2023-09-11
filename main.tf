provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name     = "broker-instance"
  key_name = "ec2_jenkins"

  instance_type = "t2.micro"
  ami           = "ami-024e6efaf93d85776"

  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.access_sg.id]
  associate_public_ip_address = true
}

resource "aws_security_group" "access_sg" {
  name   = "allow-access"
  vpc_id = module.vpc.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Access"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Access"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS Access"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "MQTT Dashboard Access"
    protocol    = "tcp"
    from_port   = 18083
    to_port     = 18083
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "MQTT WebSocket Access"
    protocol    = "tcp"
    from_port   = 8083
    to_port     = 8083
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "MQTT TCP Access"
    protocol    = "tcp"
    from_port   = 1883
    to_port     = 1883
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Broker-VPC"
  cidr = "10.10.0.0/16"

  azs             = ["us-east-2a"]
  public_subnets  = ["10.10.101.0/24"]
}