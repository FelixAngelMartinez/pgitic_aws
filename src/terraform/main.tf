# Crear recurso "aws_instance" con nombre ec2_terraform
resource "aws_instance" "ec2_terraform" {
  ami = "ami-006a0174c6c25ac06"
  instance_type = "t2.micro"
  key_name = "pgitic-key"
  subnet_id = "subnet-21199e5b"
  # Para el grupo de seguridad ponemos el ID, no el nombre
  vpc_security_group_ids = ["sg-05b7511541aa39fec"] 
}

resource "aws_instance" "ec2_terraform_provisioned" {
  ami = "ami-006a0174c6c25ac06"
  instance_type = "t2.micro"
  key_name = "pgitic-key"
  subnet_id = "subnet-21199e5b"
  vpc_security_group_ids = ["sg-05b7511541aa39fec"] 

  # Aprovisionar máquina con el playbook provision.yml para instalar Apache
  provisioner "local-exec" {
    command = "sleep 60; ansible-playbook -i '${self.public_ip},' -u ubuntu --private-key ../config/pgitic-key.pem ../provision.yml --ssh-common-args '-o StrictHostKeyChecking=no'"
  }
}