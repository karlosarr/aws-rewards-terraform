resource "aws_db_instance" "rewards_db" {
  allocated_storage    = 20
  db_name              = "rewardsdb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = var.password
  skip_final_snapshot  = true
  publicly_accessible = true
}

output "endpoint" {
  value = aws_db_instance.rewards_db.endpoint
}
