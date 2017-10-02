// security group for EFS resource
resource "aws_security_group" "efs_security_group" {
  name = "${format("vpc-sg-%s", var.efs_name)}"
  description = "Security Group vpc-sg-${var.efs_name}"
  vpc_id = "${var.vpc_id}"


  // allow FNS traffic to efs mount
  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    security_groups = ["${var.security_groups}"]
  }

  tags = "${merge(var.tags, map("Name", format("vpc-sg-%s", var.efs_name)))}"

}

resource "aws_efs_file_system" "mod" {
  creation_token = "${var.efs_name}"
  performance_mode = "${var.performance_mode}"

  tags = "${merge(var.tags, map("Name", format("%s", var.efs_name)))}"
}

resource "aws_efs_mount_target" "mod" {
  file_system_id = "${aws_efs_file_system.mod.id}"
  subnet_id      = "${var.subnet_id}"
  ip_address     = "${var.ip_address}"

  security_groups = ["${aws_security_group.efs_security_group.id}"]
}