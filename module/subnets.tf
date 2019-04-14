## Creating subnets to lunch be used by the EC2 instance.
# We want as many subnets as available
resource "aws_subnet" "this" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.cidr_block[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name          = "sbn-${var.environment}-${var.region}-${var.role}-${count.index}"
    Tracking      = "${upper(random_string.tracking.result)}"
  }
}