provider "aws"{
  access_key = "AKIAVDGSNJQH3CX4U5QT"
  secret_key = "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"
  region="ap-south-1"
}

resource "aws_ecr_repository" "registry_app_repo"{
  name="registry_app_repo"
}
