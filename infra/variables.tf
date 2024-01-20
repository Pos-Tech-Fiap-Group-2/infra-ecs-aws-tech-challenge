variable "aws_region" {
  default = "us-east-1"

}

variable "cluster_name" {
  default = "tech-challenge-cluster"

}

variable "lb_name" {
  default = "tech-challenge-lb"

}

variable "lb_tg_name" {
  default = "tech-challenge-lb-tg"

}

variable "alb_sg_name" {
  default = "tech-challenge-alb-sg"

}

variable "aws_cloudwatch_log_group" {
  default = "/ecs/tech-challenge"
}
