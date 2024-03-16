resource "aws_ecs_task_definition" "tech-challenge-api-producao" {
  family                   = "tech-challenge-producao-task"
  task_role_arn            = "arn:aws:iam::654654392738:role/LabRole"
  execution_role_arn       = "arn:aws:iam::654654392738:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "3072"
  requires_compatibilities = ["FARGATE"]
  
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = <<TASK_DEFINITION
  [
      {
        "name": "tech-challenge-api-producao",
        "image": "654654392738.dkr.ecr.us-east-1.amazonaws.com/tech-challenge-ecr:tc-api-producao",
        "cpu": 0,
        "portMappings": [
            {
                "name": "8080",
                "containerPort": 8080,
                "hostPort": 8080,
                "protocol": "tcp",
                "appProtocol": "http"
            }
        ],
        "essential": true,
        "environment": [
          {
            "name": "DB_HOST",
            "value": ""
          },
          {
            "name": "DB_DATABASE",
            "value": "tech-challenge"
          },
          {
            "name": "DB_USER",
            "value": "admin"
          },
          {
            "name": "DB_PASSWORD",
            "value": "admin"
          },
          {
            "name": "PEDIDO_API_URL",
            "value": "http://localhost:8082"
          }
      ],
        "environmentFiles": [],
        "mountPoints": [],
        "volumesFrom": [],
        "ulimits": [],
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-create-group": "true",
                "awslogs-group": "/ecs/tech-challenge-producao-task",
                "awslogs-region": "us-east-1",
                "awslogs-stream-prefix": "ecs"
            },
            "secretOptions": []
        },
        "systemControls": []
      },
      {
        "name": "aws-otel-collector",
        "image": "public.ecr.aws/aws-observability/aws-otel-collector:v0.38.1",
        "cpu": 0,
        "portMappings": [],
        "essential": true,
        "command": [
            "--config=/etc/ecs/ecs-xray.yaml"
        ],
        "environment": [],
        "mountPoints": [],
        "volumesFrom": [],
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-create-group": "true",
                "awslogs-group": "/ecs/ecs-aws-otel-sidecar-collector",
                "awslogs-region": "us-east-1",
                "awslogs-stream-prefix": "ecs"
            }
        },
        "systemControls": []
      }
    ]
 TASK_DEFINITION

  tags = {
    Name = "tech-challenge-producao-task"
  }

}

resource "aws_ecs_task_definition" "tech-challenge-rabbitmq" {
  family                   = "tech-challenge-rabbitmq-task"
  task_role_arn            = "arn:aws:iam::654654392738:role/LabRole"
  execution_role_arn       = "arn:aws:iam::654654392738:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "3072"
  requires_compatibilities = ["FARGATE"]
  
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = <<TASK_DEFINITION
  [
    {
      "name": "rabbitmq-tech-challenge",
      "image": "rabbitmq:3.9-management",
      "cpu": 0,
      "portMappings": [
        {
            "name": "15672",
            "containerPort": 15672,
            "hostPort": 15672,
            "protocol": "tcp",
            "appProtocol": "http"
        },
        {
            "name": "5672",
            "containerPort": 5672,
            "hostPort": 5672,
            "protocol": "tcp",
            "appProtocol": "http"
        }
      ],
      "essential": true,
      "environment": [
        {
            "name": "RABBITMQ_DEFAULT_USER",
            "value": "admin"
        },
        {
            "name": "RABBITMQ_DEFAULT_PASS",
            "value": "admin"
        },
        {
            "name": "RABBIT_MQ_HOST",
            "value": "localhost"
        },
        {
            "name": "RABBIT_MQ_PORT",
            "value": "5672"
        },
        {
            "name": "RABBIT_MQ_USER",
            "value": "admin"
        },
        {
            "name": "RABBIT_MQ_PASS",
            "value": "admin"
        }
      ],
      "environmentFiles": [],
      "mountPoints": [],
      "volumesFrom": [],
      "ulimits": [],
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
              "awslogs-create-group": "true",
              "awslogs-group": "/ecs/tech-challenge-task-rabbitmq",
              "awslogs-region": "us-east-1",
              "awslogs-stream-prefix": "ecs"
          },
          "secretOptions": []
      },
      "systemControls": []
    }
  ]
  TASK_DEFINITION

  tags = {
    Name = "tech-challenge-rabbitmq-task"
  }
}

resource "aws_ecs_task_definition" "tech-challenge-api-pagamentos" {
  family                   = "tech-challenge-pagamentos-task"
  task_role_arn            = "arn:aws:iam::654654392738:role/LabRole"
  execution_role_arn       = "arn:aws:iam::654654392738:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "3072"
  requires_compatibilities = ["FARGATE"]
  
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = <<TASK_DEFINITION
  [
    {
      "name": "tech-challenge-api-pagamentos",
      "image": "654654392738.dkr.ecr.us-east-1.amazonaws.com/tech-challenge-ecr:tc-api-producao:tc-api-pagamentos",
      "cpu": 0,
      "portMappings": [
        {
          "name": "8080",
          "containerPort": 8080,
          "hostPort": 8080,
          "protocol": "tcp",
          "appProtocol": "http"
        }
      ],
      "essential": true,
      "environment": [
        {
          "name": "DB_HOST",
          "value": "tech-challenge-db.cluster-c1ssc6e4s6n7.us-east-1.rds.amazonaws.com:3306"
        },
        {
          "name": "DB_USER",
          "value": "root"
        },
        {
          "name": "PRODUCAO_API_URL",
          "value": "http://23.20.48.214:8080"
        },
        {
          "name": "DB_PASSWORD",
          "value": "roottech"
        },
        {
          "name": "PEDIDO_API_URL",
          "value": "http://localhost:8080"
        },
        {
          "name": "PRODUCAO_API_URL",
          "value": "http://localhost:8080"
        },
        {
          "name": "PAYMENT_API_URL",
          "value": "https://yvj9g.wiremockapi.cloud/"
        }
      ],
      "environmentFiles": [],
      "mountPoints": [],
      "volumesFrom": [],
      "ulimits": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-create-group": "true",
          "awslogs-group": "/ecs/tech-challenge-pagamentos-task",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
        },
        "secretOptions": []
      }
    }
  ]
  TASK_DEFINITION

  tags = {
    Name = "tech-challenge-pagamentos-task"
  }
}

resource "aws_ecs_task_definition" "tech-challenge-api-pedidos" {
  family                   = "tech-challenge-pedidos-task"
  task_role_arn            = "arn:aws:iam::654654392738:role/LabRole"
  execution_role_arn       = "arn:aws:iam::654654392738:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "3072"
  requires_compatibilities = ["FARGATE"]
  
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = <<TASK_DEFINITION
  [
    {
      "name": "tech-challenge-api-pedidos",
      "image": "654654392738.dkr.ecr.us-east-1.amazonaws.com/tech-challenge-ecr:tc-api-producao:tc-api-pedidos",
      "cpu": 0,
      "portMappings": [
        {
          "name": "8080",
          "containerPort": 8080,
          "hostPort": 8080,
          "protocol": "tcp",
          "appProtocol": "http"
        }
      ],
      "essential": true,
      "environment": [
        {
          "name":"DB_HOST",
          "value":"tech-challenge-db.cluster-c1ssc6e4s6n7.us-east-1.rds.amazonaws.com"
        },
        {
          "name": "DB_USER",
          "value": "root"
        },
        {
          "name": "DB_PASSWORD",
          "value":"roottech"
        }
      ],
      "environmentFiles": [],
      "mountPoints": [],
      "volumesFrom": [],
      "ulimits": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-create-group": "true",
          "awslogs-group": "/ecs/tech-challenge-pagamentos-task",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
        },
        "secretOptions": []
      }
    }
  ]
  TASK_DEFINITION

  tags = {
    Name = "tech-challenge-pedidos-task"
  }
}
