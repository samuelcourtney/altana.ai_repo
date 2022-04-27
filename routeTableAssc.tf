resource "aws_route_table_association" "pub1" {
  subnet_id = aws_subnet.pub1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "pub2" {
  subnet_id = aws_subnet.pub2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "pub3" {
  subnet_id = aws_subnet.pub3.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pv1" {
  subnet_id = aws_subnet.pv1.id
  route_table_id = aws_route_table.pv1.id
}
resource "aws_route_table_association" "pv2" {
  subnet_id = aws_subnet.pv2.id
  route_table_id = aws_route_table.pv2.id
}
resource "aws_route_table_association" "pv3" {
  subnet_id = aws_subnet.pv3.id
  route_table_id = aws_route_table.pv3.id
}