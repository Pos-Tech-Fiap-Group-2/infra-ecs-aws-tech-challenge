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


variable "tc-pedido-sv" {
  default = "tc-pedido-sv"

}

variable "tc-pagamento-sv" {
  default = "tc-pagamento-sv"

}

variable "security_group_id" {
  default = "sg-0e41d18f4540b3587"

}

variable "vpc_id" {
  default = "vpc-0a47e4de920d31a8d"

}

variable "tc-rabbitmq-sv" {
  default = "tc-rabbitmq-sv"

}
