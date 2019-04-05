# fatch all the availability zones and store them here
data "aws_availability_zones" "available" {}
#The file which have the Jenkins installation and user custom configuration in the EC2 instance
data "template_file" "user-data-jenkins" {
  template = "${file("${path.module}/user-data-jenkins.sh")}"
  vars {
    name        = "jenkins"
    environment = "${var.environment}"
    region      = "${var.region}"
  }
}

## Random string to mark all the components of the module.
resource "random_string" "tracking" {
  length  = 6
  special = false
  upper   = false
}

