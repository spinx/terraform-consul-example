variable "connection_user" {
    default = "ubuntu"
    description = "Ubuntu SSH user"
}

variable "consul_servers_count" {
    default = 3
    description = "The number of Consul servers to launch."
}

variable "consul_instance_type" {
    default = "t2.micro"
    description = "AWS Instance type"
}

variable "consul_tag_name" {
    default = "consul"
    description = "Name tag for the servers"
}