resource "aws_launch_configuration" "ecs_laungh_config" {
    image_id = "ami-0b6a7a4862157a11a"
    iam_instance_profile = aws_iam_role.ecs_agent.name
    security_groups = [aws_security_group.ecs_group.id]
    user_data = "#!/bin/bash\necho ECS_CLUSTER-my-cluster >> /etc/ecs/ecs.config"
    instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "failure_analysis_ecs_group" { 
    name = "auto-scaling-group"
    vpc_zone_identifier = [aws_subnet.public_subnet.id]
    launch_configuration = aws_launch_configuration.ecs_laungh_config.name

    desired_capacity = 2
    min_size = 1
    max_size = 10
    health_check_grace_period = 300
    health_check_type = "EC2"
}