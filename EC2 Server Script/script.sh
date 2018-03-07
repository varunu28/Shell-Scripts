#!/bin/bash
sudo su
yum update -y
yum install httpd -y
# Change the name of s3 bucket to your bucket name
aws s3 cp s3://mywebsitebucket-varun-here /var/www/html/ --recursive
service httpd start
chkconfig httpd on
