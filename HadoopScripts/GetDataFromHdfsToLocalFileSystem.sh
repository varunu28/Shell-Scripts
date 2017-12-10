sqoop import \
--connect jdbc:mysql://127.0.0.1:3306/retail_db \
--username root \
--password cloudera \
--table orders \
--target-dir /usr/cloudera/retail_db/orders 

if [ $? != 0 ]; then
	hadoop fs -get /usr/cloudera/retail_db/orders /home/varunu28/Desktop

	hadoop fs -rm -rf /usr/cloudera/retail_db/orders
fi