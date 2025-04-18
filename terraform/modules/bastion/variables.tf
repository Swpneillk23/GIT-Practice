
variable "vpc_id" {}
variable "subnet_id" {}
variable "key_name" {
    description = "EC2 Key Pair"
    type        = string
    default     = "k8s-key.pem"
}
