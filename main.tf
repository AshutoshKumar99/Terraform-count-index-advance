provider "aws" {
    region = "ap-south-1"
}


module "dbmodule" {
    source = "./DB Server Module"
    server_names = ["mariadb", "mysql", "mssql"] #Creating 3 servers, can use length() to get number of elements inside the list
  
}

output "dbservers_privateIP" {
    value = module.dbmodule.private_ip 
}