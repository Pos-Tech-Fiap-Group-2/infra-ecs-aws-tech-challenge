resource "aws_kms_key" "tech-challenge-kms-key" {
  description             = "KMS Key for Tech-Challenge"
  deletion_window_in_days = 1
  is_enabled              = true
  enable_key_rotation     = true

}

resource "aws_cloudwatch_log_group" "tech-challenge-log-group" {
  name              = var.aws_cloudwatch_log_group
  retention_in_days = 1
}

resource "aws_ecs_cluster" "tech-challenge-cluster" {
  name = var.cluster_name

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.tech-challenge-kms-key.arn
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.tech-challenge-log-group.name
      }
    }
  }

  tags = merge(local.common_tags, {
    Name = var.cluster_name
  })
}

resource "aws_ecs_service" "tc-pedido-sv" {
  name            = var.tc-pedido-sv
  cluster         = aws_ecs_cluster.tech-challenge-cluster.id
  task_definition = var.task_definition_ar
  launch_type     = "FARGATE"

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
  task_definition = var.task_definition_ar
  launch_type     = "FARGATE"

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
  task_definition = var.task_definition_ar
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = data.aws_subnets.tech-challenge-subnet.ids
    security_groups = [data.aws_security_group.tech-challenge-alb-sg.id]
  }

  tags = merge(local.common_tags, {
    Name = var.tc-pagamento-sv
  })

}
