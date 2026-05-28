variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "email" {
  description = "Email for budget notifications"
  type        = string
}

variable "db_password" {
  description = "Password for RDS instance"
  type        = string
  sensitive   = true
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "key-ssh"
}