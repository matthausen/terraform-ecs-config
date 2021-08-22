resource "aws_ecs_task_definition" "task_definition" {
    family = "worker"
    network_mode             = "awsvpc"
    #requires_compatibilities = ["FARGATE"]
    cpu                      = 1024
    memory                   = 2048
    container_definitions = <<DEFINITION
[
  {
    "image": "heroku/nodejs-hello-world",
    "cpu": 1024,
    "memory": 2048,
    "name": "hello-world-app",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ]
  }
]
DEFINITION
}