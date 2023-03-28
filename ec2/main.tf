" {
  region = "us-west-2"
  }

  resource "aws_instance" "ec2" {
    ami           = "ami-0df24e148fdb9f1d8"
      instance_type = "t2.medium"
         count         = 1
	   tags = {
	       Name =  "Jenkins-Docker"                            #"var.ec2name"
	           }
		   }
		    /* variable "ec2name" {
		    	type = list(string)
				default = [Dev,Prod,Stage]
				}*/

				terraform {
				    backend "s3" {
				            key = "terraform/tfstate.tfstate"
					            bucket = "bootcamp30-7-tabe"
						            region = "us-west-2"
							    	
												
												      }
												      }
