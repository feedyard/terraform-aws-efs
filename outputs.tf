output "security_group_id" {
  description = "id of the efs security created for the share"
  value = "${aws_security_group.efs_security_group.id}"
}

output "efs_dns" {
  description = "dns name of the mount target"
  value = "${aws_efs_mount_target.mod.dns_name}"
}

output "efs_id" {
  description = "id of the efs resources created"
  value = "${aws_efs_file_system.mod.id}"
}