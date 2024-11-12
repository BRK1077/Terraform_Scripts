output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "bastonhost_subnet_id" {
  description = "The ID of Bastonhost Subnet 1"
  value       = aws_subnet.bastonhost_subnet_1.id
}

output "public_subnet_2_id" {
  description = "The ID of Public Subnet 2"
  value       = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  description = "The ID of Private Subnet 1"
  value       = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  description = "The ID of Private Subnet 2"
  value       = aws_subnet.private_subnet_2.id
}

output "private_subnet_3_id" {
  description = "The ID of Private Subnet 3"
  value       = aws_subnet.private_subnet_3.id
}

output "private_subnet_4_id" {
  description = "The ID of Private Subnet 4"
  value       = aws_subnet.private_subnet_4.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "nat_gateway_eip" {
  description = "The Elastic IP associated with the NAT Gateway"
  value       = aws_eip.nat.public_ip
}
