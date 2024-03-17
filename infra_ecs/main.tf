resource "aws_ecs_cluster" "tech-challenge-cluster" {
  name = var.cluster_name

  tags = merge(local.common_tags, {
    Name = var.cluster_name
  })
}

resource "aws_ecs_service" "tc-pedido-sv" {
  name            = var.tc-pedido-sv
  cluster         = aws_ecs_cluster.tech-challenge-cluster.id
  task_definition = aws_ecs_task_definition.tech-challenge-api-pedidos.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = data.aws_subnets.tech-challenge-subnet.ids
    security_groups = [data.aws_security_group.tech-challenge-alb-sg.id]
  }

  tags = merge(local.common_tags, {
    Name = var.tc-pedido-sv
  })
}


resource "aws_ecs_service" "tc-producao-sv" {
  name            = var.tc-producao-sv
  cluster         = aws_ecs_cluster.tech-challenge-cluster.id
  task_definition = aws_ecs_task_definition.tech-challenge-api-producao.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = data.aws_subnets.tech-challenge-subnet.ids
    security_groups = [data.aws_security_group.tech-challenge-alb-sg.id]
  }

  tags = merge(local.common_tags, {
    Name = var.tc-producao-sv
  })

}

resource "aws_ecs_service" "tc-pagamento-sv" {
  name            = var.tc-pagamento-sv
  cluster         = aws_ecs_cluster.tech-challenge-cluster.id
  task_definition = aws_ecs_task_definition.tech-challenge-api-pagamentos.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = data.aws_subnets.tech-challenge-subnet.ids
    security_groups = [data.aws_security_group.tech-challenge-alb-sg.id]
  }

  tags = merge(local.common_tags, {
    Name = var.tc-pagamento-sv
  })

}

resource "aws_ecs_service" "tc-rabbitmq-sv" {
  name            = var.tc-rabbitmq-sv
  cluster         = aws_ecs_cluster.tech-challenge-cluster.id
  task_definition = aws_ecs_task_definition.tech-challenge-rabbitmq.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = data.aws_subnets.tech-challenge-subnet.ids
    security_groups = [data.aws_security_group.tech-challenge-alb-sg.id]
  }

  tags = merge(local.common_tags, {
    Name = var.tc-rabbitmq-sv
  })

}
