variable "cidr" {
  default = "10.0.0.0/16"

}

variable "subnet1" {
  default = "10.0.0.0/24"
}


variable "subnet2" {
  default = "10.0.1.0/24"
}

variable "availablityZone1" {
  default = "us-east-1a"
}


variable "availablityZone2" {
  default = "us-east-1b"
}

variable "cidr_ipv4" {
  default = "0.0.0.0/0"

}
variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  default = "ami-0c30b7300f5fb34cd"

}