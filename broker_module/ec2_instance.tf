module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name     = var.instance_name
  key_name = var.key_name

  instance_type = "t2.micro"
  ami           = "ami-024e6efaf93d85776"

  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.access_sg.id]
}

resource "aws_eip" "static_ip" {
  instance = module.ec2_instance.id
}