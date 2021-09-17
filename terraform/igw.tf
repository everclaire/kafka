resource "aws_internet_gateway" "kafka" {
  vpc_id = aws_vpc.kafka.id
  tags = {
    Name = join("", [var.user_name, "kafka"])
  }
}