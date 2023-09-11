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