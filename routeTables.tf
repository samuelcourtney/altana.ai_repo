resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main.id

      
  }
  tags = {
          Name = "public"

      }
}

resource "aws_route_table" "pv1" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.ng1.id


  }
        tags = {
          Name = "pv1"

      }
}

resource "aws_route_table" "pv2" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.ng2.id

  }

      tags = {
          Name = "pv2"

      }
}

resource "aws_route_table" "pv3" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.ng3.id

  }

      tags = {
          Name = "pv3"

      }
}