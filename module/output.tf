output "ec2-instance-name" {
  value = "${aws_launch_configuration.this.name}"
}