resource "aws_key_pair" "dovekey" {
  key_name   = "dovekey"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvnKwUoSouzD5t8z0" #Replace with your public key
}
