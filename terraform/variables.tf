variable "webTrafficRule" {
  type = list(number)
  default = [ 443, 80, 3306 ]
}

variable "vpc_id" {
  type = string
}

variable "vpc_name" {
  type = string
}
