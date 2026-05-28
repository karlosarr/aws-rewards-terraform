resource "aws_security_group" "ec2_sg" {
  name        = "rewards-ec2-sg"
  description = "Allow SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "rewards_ec2" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"
  key_name      = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Rewards-EC2-Instance"
  }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "public_ip" {
  value = aws_instance.rewards_ec2.public_ip
}
