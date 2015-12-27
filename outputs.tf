output "consul_servers" {
    value = "${ join(", ", aws_instance.consul_server.*.public_ip) }"
}

output "consul_ui" {
    value = "http://${ aws_instance.consul_server.0.public_dns }"
}
