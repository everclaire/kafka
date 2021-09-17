resource "aws_route53_record" "orchestrate" {
  zone_id = aws_route53_zone.dev_private.id
  name    = "orch"
  type    = "A"
  ttl     = 300
  records = [aws_instance.orchestrate.private_ip]
}

resource "aws_route53_record" "zk_1" {
  zone_id = aws_route53_zone.dev_private.id
  name    = "zk-1"
  type    = "A"
  ttl     = 300
  records = [aws_instance.zk_1.private_ip]
}

resource "aws_route53_record" "zk_2" {
  zone_id = aws_route53_zone.dev_private.id
  name    = "zk-2"
  type    = "A"
  ttl     = 300
  records = [aws_instance.zk_2.private_ip]
}

resource "aws_route53_record" "zk_3" {
  zone_id = aws_route53_zone.dev_private.id
  name    = "zk-3"
  type    = "A"
  ttl     = 300
  records = [aws_instance.zk_3.private_ip]
}