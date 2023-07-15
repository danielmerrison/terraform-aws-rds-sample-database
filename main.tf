terraform {
  required_version = "~> 1"
  required_providers {
    aws = {
      version = "~> 3"
      source  = "hashicorp/aws"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

resource "random_password" "this" {
  length  = 16
  special = true
  # needs overide to ensure it is a volid mariadb password
  override_special = "_%@"
}
resource "aws_db_parameter_group" "this" {
  name   = "${var.name}-parameter-group"
  family = "mariadb10.5"
}

resource "aws_db_instance" "this" {
  identifier           = var.name
  allocated_storage    = 10
  engine               = "mariadb"
  engine_version       = "10.5"
  instance_class       = "db.t3.micro"
  username             = var.username
  password             = var.password == "<random_value>" ? random_password.this.result : var.password
  parameter_group_name = aws_db_parameter_group.this.name
  skip_final_snapshot  = true
  publicly_accessible  = true

  provisioner "local-exec" {
    # I am using command without sleep but if i see another connection error i might add it incase it is
    # trying to run the command before the RDS instance is fully initialised
    # command = "sleep 30s && mysql --user=${self.username} --password=${self.password} --host=${self.address} < ${path.module}/datasets/${var.dataset}.sql"
    command = "mysql --user=${self.username} --password=${self.password} --host=${self.address} < ${path.module}/datasets/${var.dataset}.sql"
  }
}
