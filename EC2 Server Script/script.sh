#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
# Change the name of s3 bucket to your bucket name
aws s3 cp s3://mywebsitebucket-varun-here/index.html /var/www/html