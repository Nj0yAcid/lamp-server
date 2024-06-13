resource "aws_instance" "lamp-server" {
  ami                    = "ami-0eaf7c3456e7b5b68"
  instance_type          = "t2.micro"
  availability_zone      = aws_subnet.public1.availability_zone
  vpc_security_group_ids = [aws_security_group.sg1.id]
  subnet_id              = aws_subnet.public1.id
  key_name               = aws_key_pair.keylamp.key_name
  user_data              = file("install.sh")
}