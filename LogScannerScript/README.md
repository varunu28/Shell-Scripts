# A HDFS Log Scanner Script

A script to search the logs in HDFS for a particular message and print the log and the line number on which the message occured.

#### Sample Run
```
Logs:
jobdetails1.err
jobdetails2.err
jobdetails3.err
jobdetails4.err

Results after running the script for HDFS location /user/testlogs
Note: The target message is present only in jobdetails4.err so it would be in the output along with the correct line number i.e. 4

Result:
/user/testlogs/jobdetails4.err
Line Number: 4
```

#### How do I run it?
 - Change the HDFS directory in which you want to search on line 2 of the script
 - Change the target message which you want to search in awk between // on line 5
 - You are all set. Run the script
