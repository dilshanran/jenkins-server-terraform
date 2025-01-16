resource "aws_instance" "web" {
  ami               = var.amiID[var.region]
  subnet_id         = "subnet-03c82" # Replace with the actual subnet ID
  instance_type     = "t3.micro"
  key_name          = aws_key_pair.dovekey.key_name
  security_groups   = [aws_security_group.dove-sg.id]
  availability_zone = var.zone1

  tags = {
    Name    = "Dove-web"
    project = "Dove"
  }

  provisioner "file" {
    source = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type     = "ssh"
    user     = var.webuser
    private_key = file("dovekey")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh",
    ]
  }

}
