resource "aws_nat_gateway" "kafka" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.sub_pub_1.id
  tags = {
    Name = join("", [var.user_name, "kafka-ngw"])
  }
}