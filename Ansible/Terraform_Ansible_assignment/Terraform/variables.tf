variable "vpc_cidr" {
  type = string
}
variable "subnet_cidr" {
  type = string
}
variable "ec2_ami" {
  type = string
}
variable "ec2_instance" {
  type = string
}
variable "instance_tags" {
    type = list
    default = ["Ansible_master", "Ansible_slave1", "Ansible_slave2", "Ansible_slave3"]
}