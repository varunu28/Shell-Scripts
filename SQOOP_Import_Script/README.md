# SQOOP IMPORT SCRIPT

 - A script handling the complete SQOOP Import. 
 - It reads table names from a file and does the import for the tables. 
 - It also handles the table without a primary key by using a single mapper for the import. 
 - It stores the output logs and error logs in a separate folder abstracting the logs from the user and providing a clean interface.
