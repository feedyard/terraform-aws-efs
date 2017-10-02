variable "efs_name" {
  description = "Reference name of the Elastic File System."
  default = ""
}

variable "performance_mode" {
  description = "The file system performance mode."
  default = "generalPurpose"
}

variable "vpc_id" {
  description = "The VPC this security group will go in"
}

variable "subnet_id" {
  description = "The id of the subnet in which to add the mount target"
}

variable "ip_address" {
  description = "The address at which the file system is mounted"
  default = ""
}

variable "security_groups" {
  description = "A list of up to 5 VPC security group IDs."
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}