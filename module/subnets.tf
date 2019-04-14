## Creating subnets to lunch be used by the EC2 instance.
# We want as many subnets as available
data "aws_vpc" "selected" {
  id = "${var.vpc_id}"

}

resource "aws_subnet" "this" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${data.aws_vpc.selected.id}"
  cidr_block        = "${cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name          = "sbn-${var.environment}-${var.region}-${var.role}-${count.index}"
    Tracking      = "${upper(random_string.tracking.result)}"
  }
}