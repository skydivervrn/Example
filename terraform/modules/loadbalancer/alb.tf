locals {
  instance_tg_map = setproduct(keys(var.port_url_mapping), var.instance_id_list)
}

resource "aws_lb" "this" {
  name               = "${replace(var.dns_domain_subdomain, "/[^a-z0-9]/", "-")}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb_sg.id]
  subnets            = var.subnet_id_list

  enable_deletion_protection = true
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_iam_server_certificate.elb_cert.arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener_certificate" "example" {
  listener_arn    = aws_lb_listener.this.arn
  certificate_arn = aws_iam_server_certificate.elb_cert.arn
}

resource "aws_lb_listener_rule" "static" {
  for_each = var.port_url_mapping

  listener_arn = aws_lb_listener.this.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[each.key].arn
  }

  condition {
    host_header {
      values = formatlist("%s.${trim(var.route53_zone.name, ".")}", each.value)
    }
  }
}

resource "aws_lb_target_group" "this" {
  for_each = var.port_url_mapping
  name     = "${each.key}-lb-tg"
  port     = each.key
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "this" {
  count = length(local.instance_tg_map)
  target_group_arn = aws_lb_target_group.this[local.instance_tg_map[count.index][0]].arn
  target_id        = local.instance_tg_map[count.index][1]
  port             = local.instance_tg_map[count.index][0]
}
