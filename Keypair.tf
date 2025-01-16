resource "aws_key_pair" "dovekey" {
  key_name   = "dovekey"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvnKwUoSouzD5t8z0Hd9W663BMG9m3ob7SKM3Ttlr5s WILEY+dmanawadu@ZSRIL-9T196D3" #Replace with your public key
}