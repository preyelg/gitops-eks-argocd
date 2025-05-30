variable "region" {
  default = "us-east-2"
}

variable "key_pair_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "linux"
}
