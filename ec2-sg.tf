provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "nexus" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.nexus_nexus.name]

    tags = {
        Name = "Nexus"
    }
}

resource "aws_ip" "Nexus_ip" {
    instance = aws_instance.web.id
}

variable "ingress" {
    type = list(number)
    default = [80,443,8081,22]
}

variable "egress" {
    type = list(number)
    default = [80,8081,]
}

resource "aws_security_group" "nexus" {
    name = "Allow Traffic"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

        dynamic "egress" {
        iterator = port
        for_each = var.egress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

output "PrivateIP" {
    value = aws_instance.nexus.private_ip
}

output "PublicIP" {
    value = aws_ip.nexus_ip.public_ip
}
