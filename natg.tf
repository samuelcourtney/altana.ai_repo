resource "aws_nat_gateway" "ng1" {
  allocation_id = aws_eip.nat1.id
  subnet_id = aws_subnet.pub1.id
  tags = {
    Name = "nat_gateway_1"
  }
}
resource "aws_nat_gateway" "ng2" {
  allocation_id = aws_eip.nat2.id
  subnet_id = aws_subnet.pub2.id
  tags = {
    Name = "nat_gateway_2"
  }
}
resource "aws_nat_gateway" "ng3" {
  allocation_id = aws_eip.nat3.id
  subnet_id = aws_subnet.pub3.id
  tags = {
    Name = "nat_gateway_3"
  }
}