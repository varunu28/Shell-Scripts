#!/bin/bash
# Imports all the tables mentioned in a file using Sqoop and routes all the logs in a separate folder(sqoopLog in this case)

# Provide the filename containing the tables to be imported in filename variable
filename=tableList

while read -r line
do
    name="$line"

    query="DESCRIBE $name"

    echo "Importing $name"

    sqoop eval --connect jdbc:mysql://ms.itversity.com:3306/retail_db \
    --username retail_user \
    --password itversity \
    --query "${query}" 1>eval.out 2>eval.err

    if grep -q 'PRI' eval.out ; then
        sqoop import \
        --connect jdbc:mysql://ms.itversity.com:3306/retail_db \
        --username retail_user \
        --password itversity \
        --table $name \
        --warehouse-dir /user/varunu28/workshop \
        1>/home/varunu28/sqoopLog/$name.log \
        2>/home/varunu28/sqoopLog/$name.err
    else    
        sqoop import \
        --connect jdbc:mysql://ms.itversity.com:3306/retail_db \
        --username retail_user \
        --password itversity \
        --table $name \
        --num-mappers 1 \
        --warehouse-dir /user/varunu28/workshop \
        1>/home/varunu28/sqoopLog/$name.log \
        2>/home/varunu28/sqoopLog/$name.err
    fi

    rm eval.out eval.err 
done < "$filename"
