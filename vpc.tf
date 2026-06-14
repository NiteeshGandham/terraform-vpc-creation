resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = local.vpc_final_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id #Association

  tags = local.vpc_final_tags

} 


#public subnet

 resource "aws_subnet" "public" {
   count = length(var.public_subnet_cidr)
   vpc_id     = aws_vpc.main.id
   cidr_block = var.public_subnet_cidr[count.index]
   availability_zone = local.av_zone[count.index]
   map_public_ip_on_launch = true

   tags =  merge (
      local.tags,
      # roboshop-dev-public-us-east-1a
      {
        Name =  "${var.project}-${var.environment}-public-${local.av_zone[count.index]}"
      },
      var.subnet_tags

     )
   }

#private subnets
 resource "aws_subnet" "private" {
   count = length(var.private_subnet_cidr)
   vpc_id     = aws_vpc.main.id
   cidr_block = var.private_subnet_cidr[count.index]
   availability_zone = local.av_zone[count.index]

   tags =  merge (
      local.tags,
      # roboshop-dev-private-us-east-1a
      {
        Name =  "${var.project}-${var.environment}-private-${local.av_zone[count.index]}"
      },
      var.subnet_tags

     )
   }

   #private subnets
 resource "aws_subnet" "database" {
   count = length(var.database_subnet_cidr)
   vpc_id     = aws_vpc.main.id
   cidr_block = var.database_subnet_cidr[count.index]
   availability_zone = local.av_zone[count.index]

   tags =  merge (
      local.tags,
      # roboshop-dev-private-us-east-1a
      {
        Name =  "${var.project}-${var.environment}-database-${local.av_zone[count.index]}"
      },
      var.subnet_tags

     )
   }