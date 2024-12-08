data "aws_ecr_authorization_token" "mytoken" {}

data "aws_caller_identity" "current" {}

resource "aws_ecr_repository" "myecr" {
  name = "matrix-ecr"
}

resource "kubernetes_secret" "ecr_credentials" {
  metadata {
    name = "ecr-credentials"
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${aws_ecr_repository.myecr.repository_url}" = {
          auth = base64encode("AWS:${data.aws_ecr_authorization_token.mytoken.password}")
        }
      }
    })
  }

  type = "kubernetes.io/dockerconfigjson"
}


