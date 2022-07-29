terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "APConsulting"

    workspaces {
      name = "aws-apieri"
    }
  }
}
