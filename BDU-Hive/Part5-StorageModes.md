Accessing Hadoop Data Using Hive: Hive Storage Formats
1
Hi. Welcome to Accessing Hadoop Data Using Hive. In this lesson we will discuss Hive
Storage Formats.
2
After completing this lesson, you should be able to:
Use a variety of File Formats in Hive
Use different SerDes with Hive
Convert data between file formats
And Understand compression in Hive
3
Hive has a distinction between how records are encoded into files and how columns are
encoded into records. We are going to take a look at Storage File Formats and Record
Formats in Hive next.
4
In Hive there a few different storage file formats we can use. The default and simplest
storage file format is the TEXTFILE. The data in a TEXTFILE is stored as plain text, one
line per record. The TEXTFILE is very useful for sharing data with other tools and also
when you want to manually edit the data in the file. However the TEXTFILE is less
efficient when compared to the following binary formats.
The SEQUENCEFILE is a flat file consisting of binary key-value pairs. With the
SEQUENCEFILE, a complete row is stored as a single binary value. The
SEQUENCEFILE is a standard format that is supported by Hadoop itself and because of
this, it is good format for sharing files within the Hadoop ecosystem.
The RCFILE is another file format that can be used with Hive. RCFILE stands for
Record Columnar File. The RCFILE stores columns of a table in a record columnar
format.
ORCFILE is a new Hive File Format that was created to provide many advantages over
the RCFILE format. ORCFILE stands for Optimized Row Columnar File. 
5
When we’re creating a new table in Hive, the STORED AS clause in HiveQL is where
we indicate the storage file format. Note that the STORED AS clause dictates how
records are stored but not how the actual values inside those records are stored. The
RCFILE and ORCFILE are an exception to that rule, as they have their own value storage
formats.
This slide contains a simple SequenceFile example. Creating a table that works with
SequenceFiles can be as easy as adding the “STORED AS SEQUENCEFILE” line to the
end of the CREATE TABLE statement.
Alternatively in Hive we can explicitly provide a specific Hadoop input or output format
class for our table. The InputFormat is used when reading data from a table and the
OutputFormat is used when writing data to a table.
6
The actual values (i.e. the data in the columns) in a record are read and written using a
Hive SerDe. SerDe is short for “Serializer/Deserializer” and is Java code that encodes
and decodes the values in a record.
When a record is read into Hive, the InputFormat is used to read that record of data
(whether it’s a string or binary). The record gets passed to the Deserializer which then
translates the record into a Java object that Hive can manipulate.
When Hive writes data out, it uses a Serializer to convert the record to the format type
expected by the OutputFormat. In other words, the Serializer takes the Java object that
Hive has been working with and turns it into something that Hive can write out.
When creating a table, the SerDe is defined in the ROW FORMAT clause.
7
Hive’s default SerDe is the LazySimpleSerDe. This SerDe is considered “Lazy” because
values are only read (i.e. Deserialized) if accessed by the query being run.
Hive also has several built-in SerDe’s including a regular expression SerDe and a Hive
Binary format SerDe.
You can also implement your own custom SerDe. Additionally there is a variety of 3rd
party SerDe’s that are available including ones that handle data in JSON and other
formats.
8
It’s pretty easy to convert data between different file formats using Hive to do the
conversion. Since a table’s metadata includes the storage format information for that
table, we can simply create a new table of the desired file format and fill it with data from
another table and Hive handles the conversion for us. 
In this example we create a new table that will be stored as a SequenceFile. We then fill
that table with data from another table that happens to be in TextFile format in this case.
Hive does the conversion and now we have a SequenceFile with data in it.
9
In Hive we can compress data files to save storage space and potentially increase the
performance of I/O jobs. There are multiple compression schemes that can be used with
Hive. A few popular compression formats are GZip, BZip2, and LZO. GZip and BZip2
both produce compressed files that are smaller than LZO’s output, however it’s done at
the cost of CPU overhead.
Text files that are in GZip format are not splittable on Hadoop. BZip2 and LZO formats
support block level compression – this means Hadoop will be able to split on blocks
letting us take advantage of it’s parallelism.
SequenceFiles also support splittable compression. SequenceFiles can be compressed
with the None, Record, or Block options.
In Hive, both intermediate and output compression is available. Intermediate compression
is for data being shuffled between MapReduce tasks. Output compression is the
compression of the final outputs of a query.
10
You have now completed this topic. Thank you for watching. 
