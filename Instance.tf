resource "aws_instance" "web" {
  ami               = data.aws_ami.amiID.id
  subnet_id         = "subnet-3d64bf4a" # Replace with the actual subnet ID
  instance_type     = "t3.micro"
  key_name          = aws_key_pair.dove-key.key_name
  security_groups   = [aws_security_group.dove-sg.id]
  availability_zone = "us-east-1c"

  tags = {
    Name    = "Dove-web"
    project = "Dove"
  }
}