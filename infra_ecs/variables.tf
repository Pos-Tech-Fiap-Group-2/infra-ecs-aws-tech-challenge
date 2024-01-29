variable "aws_region" {
  default = "us-east-1"

}

variable "cluster_name" {
  default = "tech-challenge-cluster"

}

variable "aws_cloudwatch_log_group" {
  default = "/ecs/tech-challenge"
}

variable "tc-producao-sv" {
  default = "tc-producao-sv"

}

variable "task_definition_ar" {
  default = "arn:aws:ecs:us-east-1:818048014896:task-definition/tech-challenge-task:1"
}

variable "tc-pedido-sv" {
  default = "tc-pedido-sv"

}

variable "tc-pagamento-sv" {
  default = "tc-pagamento-sv"

}

variable "security_group_id" {
  default = "sg-0d1c68c69e3d97445"

}

variable "vpc_id" {
  default = "vpc-028610ead2f7d6752"

}
