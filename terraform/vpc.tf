resource "aws_vpc" "kafka" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = join("", [var.user_name, "-", "kafka_vpc"])
  }
  enable_dns_support = true
  enable_dns_hostnames = true
}