variable "environment" {
  default = "development"
}
variable "region" {
  default = "us-east-1"
}
variable "ssh_allowed_cidr" {
    type = "list"
    description = "The IP ranges which will be allowed to SSH to the Jenkins "
    default = ["0.0.0.0/0"]

}
variable "allowed_cidr" {
    type = "list"
    description = "The IP ranges which will be allowed to use Jenkins from the WebInterface"
    default = ["0.0.0.0/0"]

}
variable "role" {
    default = "Jenkins"
  description = "The main service of the module"
}
variable "vpc_id" {
  default = ""
}
variable "cidr_block" {
    type = "list"
    default = ["1"]
  
}
variable "instance_type" {
  default = "t3.tiny"
}

variable "key_name" {
  description = "the Key "
  default = " "
}
variable "ssh_pub_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyVGaw1PuEl98f4/7Kq3O9ZIvDw2OFOSXAFVqilSFNkHlefm1iMtPeqsIBp2t9cbGUf55xNDULz/bD/4BCV43yZ5lh0cUYuXALg9NI29ui7PEGReXjSpNwUD6ceN/78YOK41KAcecq+SS0bJ4b4amKZIJG3JWmDKljtv1dmSBCrTmEAQaOorxqGGBYmZS7NQumRe4lav5r6wOs8OACMANE1ejkeZsGFzJFNqvr5DuHdDL5FAudW23me3BDmrCSJ5 your_username@hostname"
}
variable "outbound_internet" {
  default = "true"
}
