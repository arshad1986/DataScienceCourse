Accessing Hadoop Data Using Hive: Hive DML
1
Hi. Welcome to Accessing Hadoop Data Using Hive. In this lesson we will discuss Hive
DML.
2
After completing this lesson, you should be able to:
Load data into Hive
Export data out of Hive
And, Run a variety of different HiveQL DML queries
3
In order to make use of Hive we need to get some actual data into the database.
The first example shows one way to bring data into a Hive table. We load the data from a
theoretical file named users.dat into the table named users in this example. The LOCAL
keyword tells Hive to look on the local file system (i.e. our Linux file system) for the file
named users.dat in the /tmp/data folder. The local data is COPIED to its final location on
HDFS.
If we leave off the LOCAL keyword, Hive assumes the location we are referring to is on
HDFS. If our data file is on HDFS then the data is actually moved to its final location
within Hive’s grasp in HDFS. When the data is being loaded in to tables, Hive does not
do any transformations to the data.
The second example shows another local file called userny.dat being loaded into a
partitioned users table. The table is partitioned on country and state. A new HDFS
directory will be created within the users table directory called country=US which will
contain another directory called state=NY. In this example the local file is again copied
into the HDFS directory.
4
We can also load data from a whole directory into a Hive table. In this example we are
loading data from a directory of files into a users table. If you look carefully you’ll notice
this statement is missing the LOCAL keyword, therefore Hive will look to HDFS for the
data. The actual data is moved to the final location under Hive’s control on HDFS. All of
the files that were in the /user/biadmin/userdatafiles directory are copied over into Hive.
Note the OVERWRITE keyword in this statement. It causes the contents of the target
table to be deleted and replaced. If we were to leave the OVERWRITE keyword out, then
the data files would be added to the contents of the table. If that is your intention, just
make sure the new data files are named differently from the ones already existing in
Hive, otherwise Hive will overwrite the old one with the new one. 
5
Data can be loaded into Hive from a query. The first example shows that tables can be
created from the results of a query on another table in Hive. The second example is
similar, except it uses the INSERT OVERWRITE clause to get data into the new table.
6
Getting data into Hive is great, but we also need to be able to get data out of Hive in
many scenarios. Let’s say you had a table in Hive and you wanted all the data in that
table and liked the storage format the data was already in. You could just go ahead and
copy the data file right out of Hive, since you know were it is located on HDFS.
Alternatively, and perhaps more likely, you want to write out the results of a query to a
file. The example here shows you how to use the INSERT OVERWRITE LOCAL
DIRECTORY clause to do this. In our example we write out a few columns from the
sales table to the /mydirectory/dataexports directory on our local system. The data written
to the file system is by default serialized as text and the columns are separated by the
CONTROL-A character and rows are separated by newlines by default. Non-primitive
columns are serialized to JSON format. You may also explicitly specify delimiters and
file format for the exported data.
Using the INSERT OVERWRITE statement to HDFS is a good way to extract large
amounts of data from Hive because Hive can write to these directories in parallel from
within a MapReduce job.
A big warning here – the directory in the INSERT OVERWRITE statement is
Overwritten. The directory gets clobbered and replaced with output. Don’t accidentally
delete your home directory like I did when I first tried this statement out! 

Accessing Hadoop Data Using Hive: Hive DML
1
Hi. Welcome to Accessing Hadoop Data Using Hive. In this lesson we will discuss Hive
DML.
2
After completing this lesson, you should be able to:
Load data into Hive
Export data out of Hive
And, Run a variety of different HiveQL DML queries
3
In order to make use of Hive we need to get some actual data into the database.
The first example shows one way to bring data into a Hive table. We load the data from a
theoretical file named users.dat into the table named users in this example. The LOCAL
keyword tells Hive to look on the local file system (i.e. our Linux file system) for the file
named users.dat in the /tmp/data folder. The local data is COPIED to its final location on
HDFS.
If we leave off the LOCAL keyword, Hive assumes the location we are referring to is on
HDFS. If our data file is on HDFS then the data is actually moved to its final location
within Hive’s grasp in HDFS. When the data is being loaded in to tables, Hive does not
do any transformations to the data.
The second example shows another local file called userny.dat being loaded into a
partitioned users table. The table is partitioned on country and state. A new HDFS
directory will be created within the users table directory called country=US which will
contain another directory called state=NY. In this example the local file is again copied
into the HDFS directory.
4
We can also load data from a whole directory into a Hive table. In this example we are
loading data from a directory of files into a users table. If you look carefully you’ll notice
this statement is missing the LOCAL keyword, therefore Hive will look to HDFS for the
data. The actual data is moved to the final location under Hive’s control on HDFS. All of
the files that were in the /user/biadmin/userdatafiles directory are copied over into Hive.
Note the OVERWRITE keyword in this statement. It causes the contents of the target
table to be deleted and replaced. If we were to leave the OVERWRITE keyword out, then
the data files would be added to the contents of the table. If that is your intention, just
make sure the new data files are named differently from the ones already existing in
Hive, otherwise Hive will overwrite the old one with the new one. 
5
Data can be loaded into Hive from a query. The first example shows that tables can be
created from the results of a query on another table in Hive. The second example is
similar, except it uses the INSERT OVERWRITE clause to get data into the new table.
6
Getting data into Hive is great, but we also need to be able to get data out of Hive in
many scenarios. Let’s say you had a table in Hive and you wanted all the data in that
table and liked the storage format the data was already in. You could just go ahead and
copy the data file right out of Hive, since you know were it is located on HDFS.
Alternatively, and perhaps more likely, you want to write out the results of a query to a
file. The example here shows you how to use the INSERT OVERWRITE LOCAL
DIRECTORY clause to do this. In our example we write out a few columns from the
sales table to the /mydirectory/dataexports directory on our local system. The data written
to the file system is by default serialized as text and the columns are separated by the
CONTROL-A character and rows are separated by newlines by default. Non-primitive
columns are serialized to JSON format. You may also explicitly specify delimiters and
file format for the exported data.
Using the INSERT OVERWRITE statement to HDFS is a good way to extract large
amounts of data from Hive because Hive can write to these directories in parallel from
within a MapReduce job.
A big warning here – the directory in the INSERT OVERWRITE statement is
Overwritten. The directory gets clobbered and replaced with output. Don’t accidentally
delete your home directory like I did when I first tried this statement out! 
