variable "environment" {
  default = "Dev"
}
variable "region" {
  default = "ap-southeast-2"
}
variable "ssh_allowed_cidr" {
    type = "list"
    description = "The IP ranges which will be allowed to SSH to the Jenkins "
}
variable "allowed_cidr" {
    type = "list"
    description = "The IP ranges which will be allowed to use Jenkins from the WebInterface"
}
variable "role" {
    default = "JN"
  description = "The main service of the module"
}
variable "vpc_id" {
  
}
variable "cidr_block" {
    type = "list"
  
}
variable "instance_type" {
  default = "t3.tiny"
}

variable "key_name" {
  description = "the Key "
}
variable "ssh_pub_key" {
  
}
variable "outbound_internet" {
  
}
