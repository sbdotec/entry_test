resource "aws_alb_target_group" "tg" {
  name     = "${var.cluster_name}-tg"
  port     = 30080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
