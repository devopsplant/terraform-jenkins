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

## Creating subnets to lunch be used by the EC2 instance.
# We want as many subnets as available
resource "aws_subnet" "this" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.cidr_block[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name          = "sbn-${var.environment}-${var.region}-${var.role}-${count.index}"
    Project       = "${var.project}"
    Tracking      = "${upper(random_string.tracking.result)}"
  }
}