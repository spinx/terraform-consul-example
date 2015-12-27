resource "aws_security_group" "consul" {
    name = "consul"
    description = "Consul traffic."

    ingress {
        from_port = 22
        to_port = 22    
        protocol = "tcp"
        cidr_blocks = [
            "0.0.0.0/0", # DANGER change to your IPs only
        ]
    }

    ingress {
        from_port = 80
        to_port = 80    
        protocol = "tcp"
        cidr_blocks = [
            "0.0.0.0/0", # DANGER change to your IPs only
        ]
    }

    # These are for internal traffic
    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        self = true
    }

    ingress {
        from_port = 0
        to_port = 65535
        protocol = "udp"
        self = true
    }

    # This is for outbound internet access
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}