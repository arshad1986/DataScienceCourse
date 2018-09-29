Part2

Accessing Hadoop Data Using Hive: Hive DDL – VIDEO 1
1
Hi. Welcome to Accessing Hadoop Data Using Hive. In this lesson we will discuss Hive
DDL.
2
After completing this lesson, you should be able to:
Create databases and tables in Hive, while using a variety of different Data Types.
Run a variety of different DDL commands.
Use Partitioning to improve performance of Hive queries.
And create Managed and External tables in Hive.
3
In Hive data is organized into the following units.
First data is organized into Databases which are namespaces that separate tables and
other data units from naming conflicts.
Next data is organized into tables which are homogenous units of data that have the same
schema.
Data can then be organized into partitions, though this is not a requirement. A Partition in
Hive is a virtual column that defines how data is stored on the file system based on its
values. A table can have zero or more partitions.
Finally, in each partition, data can be organized into Buckets based on the hash value of a
column in the table.
Again, note that it isn’t necessary for tables to be partitioned or bucketed in Hive,
however these abstractions allow the system to prune large quantities of data during
query processing, resulting in faster query execution and reduced latencies.
4
Now that you’ve seen that Hive logically breaks data out into Databases, Tables, and
Partitions, let’s take a look at how this data is physically stored.
Data files in Hive are stored right in the Hadoop file system. A variety of different
storage and record formats can be used for your data. The internal format of your data
can really vary from table-to-table depending on how you want to set things up.
In Hive your data is stored in the warehouse directory as specified in your configuration
file unless you override this location.
Listed on this slide is an example of how Hive stores databases, tables, partitions, and
buckets. You can see that a directory is created for a database and inside that is a
subdirectory for a table, that itself contains a subdirectory for a partition. The actual file
that holds the data would be stored inside that partition folder in this example. 
If we chose to bucket the table in this example, then our data would be divided up into
multiple bucket files and stored inside of the partition directory. In this example our data
is stored in 32 bucketed data files inside of the partition directory. When creating this
table, we would specify the number of buckets – it is not a randomly assigned number.
5
Creating a database in Hive is easy. It can be as simple as typing three words – “create
database” followed by the name you’d like the database to be called. There are additional
options you can add to your basic Create statement, such as specifying the location you’d
like the database to be created - and adding a comment to the metadata for that database.
6
To view a listing of the databases in Hive, simply run the statement “Show Databases” in
the Hive shell. You can show information about an individual database by using the
“Describe” statement. By adding the word “Extended” to the Describe statement, you can
get additional information about the database.
7
A typical Hive installation comes installed with a “default” database. This default
database is used if you run statements without first specifying which database you’d like
to work with.
To tell Hive that you’d like to work with a certain database, simply enter the USE
statement in the Hive shell.
To delete a database in Hive, you use the Drop Database syntax. It is also possible to alter
the DBPROPERTIES of a database by using the Alter command.
8
Before we look at Tables in Hive, it is prudent that we review the different Data Types
available for use. Data types are associated with the columns in a table.
Hive has a variety of primitive data types available – though not as many as the typical
RDBMS has. There are multiple Integer types, including TINYINT, SMALLINT, INT,
and BIGINT. There is a BOOLEAN type which can be True or False. There are three
floating point number types, specifically FLOAT, DOUBLE, and DECIMAL. Hive has
two STRING types – String and VARCHAR. There are two Date/Time formats –
TIMESTAMP and DATE. Hive also has a Binary type.
When comparing different data types in a Hive query, it’s important to note that casting
will take place. If two different types of integers are compared, then the smaller integer
type will be cast to the larger type and so on.
9
Complex data types can be built up from the primitive types we just reviewed. If you’ve
worked with different programming languages then these may look familiar.
The ARRAY data type is an indexable list containing elements of the same type. Note
that arrays in Hive are zero-based. 
The STRUCT data type in Hive represents a collection of elements of different types. Dot
notation is used to access the elements in a Struct.
The MAP data type is a collection of key-value tuples. The keys must be primitive typed,
but the values can be any type.
Hive also has a Union data type which can at any one point hold exactly one of their
specified data types.

Accessing Hadoop Data Using Hive: Hive DDL – VIDEO 2
1
Now that we know what data types can be used in Hive, let’s look at an example of a
simple Hive table being created with HQL. In this example a table named “users” is
being created with 4 columns.
There is an ID column which is of the INT data type, along with an office_id column of
the same type. There also is a name column that is of the String data type, and finally an
array column called “children” which can hold String values.
We tell Hive that the fields in our rows are delimited by the pipe character. We then tell
Hive that the collection items in the array field are terminated by the colon character.
Finally, we explicitly specify that our data file is a plain text file.
Once our table is created, we can then run the “show tables” statement to see a listing of
all the tables in our database. We can also use the “DESCRIBE” statement to view some
metadata for a specific table. Further, we can use “DESCRIBE EXTENDED” to view
additional table metadata.
2
In this example, our new users table will now be partitioned on “division”, which we
specify is of the String data type. We accomplished this by adding the PARTITION BY
clause. Division will now be a virtual column – the division is not actually stored in the
data file with the rest of the data.
Now that we have a partitioned table, once data is loaded in, our Hive queries will be able
to take advantage of the fact that each partition is a separate directory that contains just
that one partitions’ data on the file system. This will help us achieve better performance
especially when running queries with WHERE clauses. The less data we need to read and
process for a given query, the better, as we gain the benefit of reduced latency.
Inside the box on this screen you can get a feel for what the physical directory structure
would look like for a table with 3 partitions. Down the Warehouse path we can see the
directory for the database, the table, and the partition.
3
Tables in Hive can either be Managed or External. Tables by default are Managed by
Hive – Hive controls the metadata for that table AND the lifecycle of the actual data in
the table. The managed table data is stored in subdirectories within the configured
warehouse directory. Dropping a managed table will delete the actual table data in
addition to the metadata Hive stored for that table. 
Let’s contrast this behavior to Hive’s External Tables. An external table’s data file(s) are
stored in a location outside of Hive. Hive does not assume it owns the data in the table –
dropping an external table deletes just the table metadata and leaves the actual data
untouched. External tables can be useful if you are sharing your data with other tools
outside of Hive. Creating an external table simply requires the addition of the
EXTERNAL and LOCATION keywords in a create table statement.
4
Dropping a table in Hive is done using the Drop Table syntax. There are a variety of
ways to Alter a Hive table. We can change the name of a table, add or remove columns,
alter table properties and more.
5
In Hive there’s a variety of advanced topics, one of them being Indexing. The goal of
Hive indexing is to improve the speed of query lookups for certain columns of a table.
It’s important to note that the speed improvement comes at the cost of processing and
disk space as the index data is stored in another table on the file system.
Here’s a few simple statements that demonstrate how to create, show and delete an index.
There’s also a variety of other indexing topics including bitmap indexes and more.
6
You have now completed this topic. Thank you for watching. 
