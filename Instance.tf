resource "aws_instance" "web" {
  ami               = var.amiID[var.region]
  subnet_id         = "subnet-3d64bf4a" # Replace with the actual subnet ID
  instance_type     = "t3.micro"
  key_name          = aws_key_pair.dove-key.key_name
  security_groups   = [aws_security_group.dove-sg.id]
  availability_zone = var.zone1

  tags = {
    Name    = "Dove-web"
    project = "Dove"
  }
}