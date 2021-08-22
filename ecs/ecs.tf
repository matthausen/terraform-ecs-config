resource "aws_ecs_cluster" "ecs_cluster" {
    name = "my-cluster"
}

# ecs service
resource "aws_ecs_service" "worker" {
    name = "cluster"
    cluster = aws_ecs_cluster.ecs_cluster.id
    task_definition = aws_ecs_task_definition.task_definition.arn
    desired_count = 2
}