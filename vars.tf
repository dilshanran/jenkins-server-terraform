variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1c"
}

variable "amiID" {
  type = map(any)
  default = {
    us-east-1 = "ami-07a63969ac0961461"
    us-west-2 = "ami-036841078a4b68e14"
  }
}