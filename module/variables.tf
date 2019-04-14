variable "environment" {
  default = "development"
}
variable "region" {
  default = "ap-southeast-2"
}
variable "ssh_allowed_cidr" {
    description = "The IP ranges which will be allowed to SSH to the Jenkins "
}
variable "allowed_cidr" {
    description = "The IP ranges which will be allowed to use Jenkins from the WebInterface"
}
variable "role" {
  description = "The main service of the module"
}
variable "vpc_id" {
  
}
variable "cidr_block" {
  
}

