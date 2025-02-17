variable "project" {
  type    = string
  default = "dla-infra-team-sandbox"
}
variable "region" {
  type    = string
  default = "asia-southeast2"
}
variable "zone" {
  type    = string
  default = "asia-southeast2-b"
}
variable "compute_sa" {
  type    = string
  default = "vm-sa-custom@dla-infra-team-sandbox.iam.gserviceaccount.com"
}
variable "vpc" {
  type    = string
  default = "https://www.googleapis.com/compute/v1/projects/dla-infra-team-sandbox/global/networks/net-akhid"
}

variable "subnet" {
  type    = string
  default = "https://www.googleapis.com/compute/v1/projects/dla-infra-team-sandbox/regions/asia-southeast2/subnetworks/sub-net-akhid"
}

# Subnet Proxy for Regional Load Balance
variable "subnet_proxy" {
  type    = string
  default = "https://www.googleapis.com/compute/v1/projects/dla-infra-team-sandbox/regions/asia-southeast2/subnetworks/reverse-subnet-for-lb"
}

variable "service_account_key" {
  description = "Service account key in JSON format"
  type        = string
}
