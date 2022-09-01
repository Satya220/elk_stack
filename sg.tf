resource "aws_security_group" "Demoserver_sg" {
  name        = "Demo_server"
  description = "Allow connection to Demo Server "
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    description     = "SSH from Bastion host"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.Bastion_server.id]
    
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["192.168.2.0/24"]
  }

  tags = {
    Name = "demo-server-sg"
  }
}

resource "aws_security_group" "logstash_server" {
  name        = "logstash_server"
  description = "Allow connection to logstash Server "
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    description     = "Connection from Elasticsearch"
    from_port        = 5044
    to_port          = 5044
    protocol         = "tcp"
    security_groups  = [aws_security_group.Elastic_server_sg.id, aws_security_group.Demoserver_sg.id]
    
  }

  ingress {
    description     = "SSH to logstash"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.Bastion_server.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "logstash-server-sg"
  }
}

resource "aws_security_group" "Elastic_server_sg" {
  name        = "Elastic_server_sg"
  description = "Allow connection to Elasticsearch Server "
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    description     = "Connection from Elasticsearch"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    security_groups  = [aws_security_group.Kibana_server_sg.id]
    
  }

  ingress {
    description     = "SSH to Elasticsearch"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.Bastion_server.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elasticsearch-server-sg"
  }
}

resource "aws_security_group" "Kibana_server_sg" {
  name        = "Kibana_server_sg"
  description = "Allow connection to Kibana Server "
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    description     = "Connection from Kibana"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description     = "SSH to Kibana"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.Bastion_server.id]
    
  }

  ingress {
    description     = "Http connection to Kibana"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
   
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kibana-server-sg"
  }
}

resource "aws_security_group" "Bastion_server" {
  name        = "Bastion_server"
  description = "Allow connection to Bastion Server"
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    description      = "SSH to Bastion"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion-server-sg"
  }
}


  

