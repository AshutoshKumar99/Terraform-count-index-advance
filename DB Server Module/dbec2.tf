variable "server_names" {
    type = list(string)
  
}

#Creating 3 ins of the db resource
resource "aws_instance" "db" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
  count = length(var.server_names) // returns 3 as there are 3 elements in the list server_names
   

 tags = {
     Name = var.server_names[count.index]
 }
   

}

output "private_ip" {
    value = [aws_instance.db.*.private_ip] // used * as we are creating 3 nstances of db resource, wrap this in list for nice look in output
    #value = aws_instance.db.1.private_ip
    #value = aws_instance.db.2.private_ip
     #value = aws_instance.db.3.private_ip
     
}