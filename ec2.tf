resource "aws_instance" "Elastic_server" {
  ami           = ami-0d75513e7706cf2d9
  instance_type = "t3.micro"

    tags = {
    Name = "Elastic Server"
  }

  vpc_security_group_ids = [aws_security_group.lab_vpc.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.private subnet.id
}

resource "aws_instance" "Logstash_server" {
  ami           = ami-0d75513e7706cf2d9
  instance_type = "t3.micro"

    tags = {
    Name = "Logstash Server"
  }

  vpc_security_group_ids = [aws_security_group.lab_vpc.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.private subnet.id
}

resource "aws_instance" "Kibana_server" {
  ami           = ami-0d75513e7706cf2d9
  instance_type = "t3.micro"

    tags = {
    Name = "Kibana Server"
  }
  vpc_security_group_ids = [aws_security_group.lab_vpc.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.public subnet.id
}

resource "aws_instance" "Bastion_host" {
  ami           = ami-0d75513e7706cf2d9
  instance_type = "t3.micro"

    tags = {
    Name = "Bastion host"
  }
  vpc_security_group_ids = [aws_security_group.lab_vpc.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.public subnet.id
}

resource "aws_instance" "Demo-1" {
  ami           = ami-0d75513e7706cf2d9
  instance_type = "t3.micro"

    tags = {
    Name = "Demo-1"
  }
  vpc_security_group_ids = [aws_security_group.lab_vpc.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.data-a.id
}

resource "aws_instance" "Demo-2" {
  ami           = ami-0d75513e7706cf2d9
  instance_type = "t3.micro"

    tags = {
    Name = "Demo-2"
  }
  vpc_security_group_ids = [aws_security_group.lab_vpc.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.data-b.id
}

resource "aws_instance" "Demo-3" {
  ami           = ami-0d75513e7706cf2d9
  instance_type = "t3.micro"

    tags = {
    Name = "Demo-3"
  }
  vpc_security_group_ids = [aws_security_group.lab_vpc.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.data-c.id
}

  resource "aws_eip" "ansible_eip" {
    instance=aws_instance.ansible_server.id

  }