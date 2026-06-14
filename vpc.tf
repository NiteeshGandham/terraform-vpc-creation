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

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = ["10.0.1.0/24","10.0.1.0/24"]

  tags = {
    Name = "Main"
  }
}