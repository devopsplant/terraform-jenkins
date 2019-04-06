resource "aws_security_group" "this" {
  name        = "sgp-${var.environment}-${var.region}-${var.role}"
  description = "Rules for ${var.role} EC2 instances rules"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name          = "sgp-${var.environment}-${var.region}-${var.role}"
    Owner         = "${var.owner}"
    ProvisionedBy = "${var.provisioned_by}"
    Project       = "${var.project}"
  }
}

resource "aws_security_group_rule" "rule_ssh_in_cidr" {
  count             = "${length(var.ssh_allowed_cidr) > 0 ? 1 : 0}"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.ssh_allowed_cidr}"]
  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "rule_jenkins_in_https_cidr" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["${var.allowed_cidr}"]
  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "rule_jenkins_in_http_cidr" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["${var.allowed_cidr}"]
  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "rule_to_internet" {
  type              = "egress"
  description       = "Allow outgoing access to the internet"
  from_port         = 1
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]      
  security_group_id = "${aws_security_group.this.id}"
}
