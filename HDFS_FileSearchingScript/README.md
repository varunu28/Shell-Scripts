# HDFS File Searching Script

A script to search the HDFS for a list of files. If the file is present, it returns the number of lines in the file and the size of the file

#### Sample Run
```
Input File:
a_b_c_d_1
a_b_c_d_2
a_b_c_d_3
a_b_c_d_4
script.sh

Results after running the script for HDFS location /user/test.
Note: The script file is also present in the local filesystem so it won't get located on HDFS

a_b_c_d_1
a_b_c_d_1 is Present in HDFS
Num of lines in a_b_c_d_1: 1
Space of a_b_c_d_1: 2 bytes
a_b_c_d_2
a_b_c_d_2 is Present in HDFS
Num of lines in a_b_c_d_2: 1
Space of a_b_c_d_2: 2 bytes
a_b_c_d_3
a_b_c_d_3 is Present in HDFS
Num of lines in a_b_c_d_3: 1
Space of a_b_c_d_3: 2 bytes
a_b_c_d_4
a_b_c_d_4 is Present in HDFS
Num of lines in a_b_c_d_4: 6
Space of a_b_c_d_4: 12 bytes
script.sh
script.sh is not Present in HDFS
```
