resource "aws_key_pair" "dove-key" {
  key_name   = "dove-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvnKwUoSouzD5t8z0Hd9W663BMG9m3ob" #Replace with your public key
}