resource "aws_ecs_task_definition" "registry_task" {
  family                   = "registry"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn = "${aws_iam_role.ecsTaskExecutionRole.arn}"
  cpu    = 512
  memory = 1024
  container_definitions = <<DEFINITION
  [
    {
      "name"  : "registry",
      "image" : "350481107983.dkr.ecr.ap-south-1.amazonaws.com/registry_app_repo"
    }
  ]
  DEFINITION
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = "${aws_iam_role.ecsTaskExecutionRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}