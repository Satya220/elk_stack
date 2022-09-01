resource "aws_instance" "Elastic_server" {
  ami           = data.aws_ami.Elastic_server.id
  instance_type = "t3.micro"

    tags = {
    Name = "Elastic Server"
  }

  vpc_security_group_ids = [aws_security_group.Elastic_server_sg.id]
  key_name = "elk_key"
  subnet_id = data.aws_subnet.private_a.id
}

resource "aws_instance" "Logstash_server" {
  ami           = data.aws_ami.Logstash_server.id
  instance_type = "t3.micro"

    tags = {
    Name = "Logstash Server"
  }

  vpc_security_group_ids = [aws_security_group.logstash_server.id]
  key_name = "elk_key"
  subnet_id = data.aws_subnet.private_a.id
}

resource "aws_instance" "Kibana_server" {
  ami           = data.aws_ami.Kibana_server.id
  instance_type = "t3.micro"

    tags = {
    Name = "Kibana Server"
  }
  vpc_security_group_ids = [aws_security_group.Kibana_server_sg.id]
  key_name = "elk_key"
  subnet_id = data.aws_subnet.public_subnet.id
}

resource "aws_instance" "Bastion_host" {
  ami           = data.aws_ami.Bastion_host.id
  instance_type = "t3.micro"

    tags = {
    Name = "Bastion host"
  }
  vpc_security_group_ids = [aws_security_group.Bastion_server.id]
  key_name = "elk_key"
  subnet_id = data.aws_subnet.public_subnet.id
}

resource "aws_instance" "Demo-1" {
  ami           = data.aws_ami.Demo_server.id
  instance_type = "t3.micro"

    tags = {
    Name = "Demo-1"
  }
  vpc_security_group_ids = [aws_security_group.Demoserver_sg.id]
  key_name = "elk_key"
  subnet_id = data.aws_subnet.private_b.id
}

resource "aws_instance" "Demo-2" {
  ami           = data.aws_ami.Demo_server.id
  instance_type = "t3.micro"

    tags = {
    Name = "Demo-2"
  }
  vpc_security_group_ids = [aws_security_group.Demoserver_sg.id]
  key_name = "elk_key"
  subnet_id = data.aws_subnet.private_c.id
}

resource "aws_instance" "Demo-3" {
  ami           = data.aws_ami.Demo_server.id
  instance_type = "t3.micro"

    tags = {
    Name = "Demo-3"
  }
  vpc_security_group_ids = [aws_security_group.Demoserver_sg.id]
  key_name = "elk_key"
  subnet_id = data.aws_subnet.private_d.id
}
