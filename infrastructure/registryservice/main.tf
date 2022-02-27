provider "aws"{
  access_key = "AKIAVDGSNJQH3CX4U5QT"
  secret_key = "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"
  region="ap-south-1"
}

resource "aws_ecs_cluster" "registry_cluster"{
  name="registry_cluster"
}

resource "aws_ecs_service" "my_first_service" {
  name            = "my-first-service"
  cluster         = "${aws_ecs_cluster.registry_cluster}"
  task_definition = "${aws_ecs_task_definition.registry_task.arn}"
  launch_type     = "FARGATE"
  desired_count   = 3

  network_configuration {
    subnets          = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]
    assign_public_ip = true
  }
}