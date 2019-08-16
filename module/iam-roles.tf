resource "aws_iam_role" "this" {
  name = "${var.role}EC2Role"


  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_instance_profile" "this" {
  name = "${var.role}EC2Profile"
  role = "${aws_iam_role.this.name}"
}