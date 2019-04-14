data "aws_ami" "this" {
  most_recent      = true
  owners = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn*"]
  }
}
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
## EC2 Key pair
resource "aws_key_pair" "this" {
  key_name   = "jenkins"
  public_key = "${var.ssh_pub_key}"
}
## Random string to mark all the components of the module.
resource "random_string" "tracking" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_launch_configuration" "this" {
  name_prefix          = "${var.role}-${var.environment}-${random_string.tracking.result}"
  image_id             = "${data.aws_ami.ecs_ami.image_id}"                                 
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.this.name}"
  key_name             = "${aws_key_pair.this.key_name}"
  security_groups      = ["${aws_security_group.this.id}"]
  user_data            = "${data.template_file.user-data-jenkins.rendered}"

  lifecycle {
    create_before_destroy = true
  }


}
resource "aws_autoscaling_group" "this" {
  name                 = "asg-${var.environment}-${var.role}-${random_string.tracking.result}"
  availability_zones   = ["${data.aws_availability_zones.available.names}"]
  launch_configuration = "${aws_launch_configuration.this.name}"
  desired_capacity     = 1
  min_size             = 1
  max_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.this.*.id}"]

  tag {
    key                 = "Name"
    value               = "ec2-${var.environment}-${var.role}-${upper(random_string.tracking.result)}"
    propagate_at_launch = "true"
  }

  tag {
    key                 = "Owner"
    value               = "${var.owner}"
    propagate_at_launch = "true"
  }

  tag {
    key                 = "Project"
    value               = "${var.project}"
    propagate_at_launch = "true"
  }


  lifecycle {
    create_before_destroy = true
  }
}