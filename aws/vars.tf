variable "amis" {
  type = map(string)

  default = {
    "us-east-1" = "ami-052efd3df9dad4825"
    "us-east-2" = "ami-02d1e544b84bf7502"
  }
}

variable "cdirs_acesso_remoto" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
