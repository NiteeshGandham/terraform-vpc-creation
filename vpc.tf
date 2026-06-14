resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = local.vpc_final_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = local.vpc_final_tags

}


#public subnet

# resource "aws_subnet" "public" {
#   count = length(var.public_subnet_cidr)
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.public_subnet_cidr[count.index]

#   tags = {
#     Name = "Main"
#   }
# }