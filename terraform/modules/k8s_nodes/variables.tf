
variable "vpc_id" {}
variable "subnet_id" {}
variable "key_name" {}
variable "bastion_private_cidr" {
  description = "CIDR block of the bastion host (e.g., 10.0.1.0/24)"
  default = "10.0.1.0/24"
}
