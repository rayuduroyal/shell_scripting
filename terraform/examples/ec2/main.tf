resource "aws_instance" "sample" {
  count                  = var.env == "prod" ? 1: 0
  ami                    = ami-0855cab4944392d0a
  instance_type          = var.instance_type == "" ? "t3.micro" : var.instance_type
  vpc_security_group_ids = [var.SGID]

  tags = {
    Name = element(var.name, count.index)
  }
}

variable "SGID" {}
variable "name" {}

variable "instance_type" {}
variable "env" {}

