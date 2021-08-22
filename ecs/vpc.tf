resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16" #could change based on zone
    enable_dns_support = true
    enable_dns_hostnames = true
}