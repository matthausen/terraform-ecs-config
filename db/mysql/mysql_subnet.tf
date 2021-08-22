resource "aws_db_subnet_group" "mysql-subnet-group" {
    name = "mysql-subnet-group"
    subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id]
}