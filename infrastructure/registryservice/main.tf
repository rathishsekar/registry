provider "aws"{
  access_key = "access_key"
  secret_key = "secret_key"
  region="ap-south-1"
}

resource "aws_ecs_cluster" "registry_cluster"{
  name="registry_cluster"
}

resource "aws_ecs_service" "registry_service" {
  name            = "registry_service"
  cluster         = "${aws_ecs_cluster.registry_cluster.arn}"
  task_definition = "${aws_ecs_task_definition.registry_task.arn}"
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]
    assign_public_ip = true
  }
}