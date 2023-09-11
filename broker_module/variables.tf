variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "broker-instance"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "secret_key"
}
