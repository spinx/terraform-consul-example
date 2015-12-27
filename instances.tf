resource "aws_instance" "consul_server" {
    ami = "${module.ami.ami_id}"
    instance_type = "${var.consul_instance_type}"
    key_name = "${var.key_name}"
    count = "${var.consul_servers_count}"
    availability_zone = "${ element(split(",", module.aws_az.list_all), count.index) }" # ensure servers are launched in seperate AZs
    
    vpc_security_group_ids = [
        "${aws_security_group.consul.id}"
    ]

    connection {
        user = "${var.connection_user}"
        key_file = "${var.key_path}"
    }

    tags {
        Name = "${var.consul_tag_name}-${count.index+1}"
        Environment = "production"
        Role = "consul"
    }

    # Set some data
    provisioner "remote-exec" {
        inline = [
            "echo ${var.consul_servers_count} > /tmp/consul-server-count",
            "echo ${aws_instance.consul_server.0.private_ip} > /tmp/consul-server-addr",
            "echo ${var.atlas_token} > /tmp/consul-atlas-token",
            "echo ${var.atlas_name} > /tmp/atlas-name",
            "echo ${var.aws_region} > /tmp/consul-datacenter",
        ]
    }
    
    # Upgrade and set variables
    provisioner "remote-exec" {
        scripts = [
            "${path.module}/scripts/upgrade.sh",
            "${path.module}/scripts/variables.sh",
        ]
    }

    # Run ansible
    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --user=${var.connection_user} -i \"${self.public_ip},\" ${path.module}/ansible/playbook.yml"
    }
}
