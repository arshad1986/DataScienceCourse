MapReduce Programming #1
MapReduce Overview
1
MapReduce is a programming model for processing large data sets with a parallel, distributed
algorithm on a cluster. In our case, the Hadoop Distributed File System (HDFS) is used and this
provides a cluster of commodity-quality datanodes over which the blocks of the files are
distributed.
A MapReduce (MR) program comprises a Map procedure or routine that performs extraction,
filtering, and sorting and a Reduce procedure that performs a summary operation. The
MapReduce infrastructure or framework coordinates and controls the distributed servers,
running the various tasks in parallel, managing all communications and data transfers between
the various parts of the system, providing for redundancy and fault tolerance, and overall
management of the whole process.
The model is inspired by Map and Reduce functions commonly used in functional programming,
although their purpose in the MapReduce framework is not the same as their original forms. All
the same, functional programming breaks down a problem into a set of functions that take inputs
and produce outputs — and that is the origin of the approach.
The key contributions of the Hadoop MapReduce framework are not the actual map and reduce
functions — since you supply differing Map and Reduce functions (generally in the form of Java
classes) dependent of the work that needs to be done — but the scalability and fault-tolerance
achieved for a variety of applications by optimizing the execution engine once. In addition to the
framework, you supply for each specific problem the mapper algorithm (or piece of code), the
reducer algorithm, and any appropriate parameters.
The name MapReduce originally referred to a proprietary Google technology, but has since been
genericized.
2
After completing this topic, you will be able to:
 Describe & explain the term map in regard to Hadoop
 Describe & explain the term reduce in regard to Hadoop
 Describe how the JobTracker and TaskTrackers work with MapReduce
 Explain the fault tolerance capability of MapReduce
There is a single JobTracker for the cluster. Each datanode on the cluster has a TaskTracker and
thus there are multiple TaskTrackers — possibly dozen, hundreds, or thousands, depending on
the number of nodes in the cluster. 
3
What is MapReduce?
It is a way to process large data sets by distributing the work across a large number of nodes.
Prior to executing the Mapper function, the master node partitions the input into smaller subproblems
which are then distributed to worker nodes.
The JobTracker runs on the master node, and a TaskTracker works on each data (or worker)
node. Worker nodes may themselves act as master nodes in that they in turn may partition the
sub-problem into even smaller sub-problems.
In the Reduce step the master node takes the answers from all of the Mapper sub-problems and
combines them in such as way as to get the output that solves the problem.
4
Let’s look at an analogy to understand the concept. For the moment, forget about Hadoop.
Let's look at the MapReduce paradigm in something more familiar, a relational database. Since
this is an IBM course, DB2 will be used in this example, but other RDBMS closely follow suit.
Assume that you have a massively parallel processing database environment. This is similar to a
Hadoop cluster in that you have multiple machines or nodes working together. Next assume that
you have an employee table that is partitioned across multiple nodes in your DB2 system. This is
just a somewhat technical way of saying that portions of the employee table reside on various
nodes in the database cluster, although to the user, the employee table appears as a single entity.
A client program connects to the coordinator node and sends a request to total the number of
employees in each job classification. The coordinator node in turn sends that request to each of
the nodes on which a portion of the employee table resides. Since for this request there is no
inter-data dependencies, each sub-agent is able to process the request against its portion of the
table in parallel with all of the other sub-agents.
Each sub-agent reads through the portion of the employee table that it stores and extracts the job
classification for each employee. Then each sub-agent sorts the results in job classification
sequence. Each sub-agent reads through the sorted results, counting the number of records for
each job classification. Finally each sub-agent sends, for each job classification, a single record
back to the coordinator node with the job classification value and its number of occurrences.
Once the coordinator node has all results from the sub-agents, it is able to then sort the records
on job classification and come up with a total for each job classification. The coordinator then
returns its results to the client.
In this example, the work done by the sub-agents is the mapping phase. The work handled by the
coordinator is the reduce phase.
The analogy breaks down somewhat in the case of Hadoop MR in that Hadoop MR generally
provides multiple Reduce tasks to finalize the output. Note that a unified result — one output
file — is not a requirement for the output Hadoop MR, but you could — if you wish — require
that only one Reduce task run. It all depends on what you need to get done. 
With large problems, you might prefer the output files themselves to be distributed across the
HDFS as the output of this MR job may be the input to a separate and later MR job or another
job. This chaining of jobs can be done with Oozie or other job coordination frameworks.
We continue in the next video. 

5
MapReduce Overview (Continued)
6
Now let’s come back to Hadoop MR and look at the Mapper.
A Map function reads an input file — or, generally, a split of a file (in the form of a block or
blocks of a file or files) — creates a series of key / value pairs, processes each pair, and generates
zero or more output key / value pairs. Map functions do not require any order in the input data
and do not provide or require dependencies from one record of data to another. The output of a
Map function is written to the local file system as only one copy is needed — it is input to a
Reduce function and just a temporary set of data.
Let's look at an example. Assume that you want to count the occurrences of the various words in
a set of documents — this is the standard WordCount example program. The Map function
running on each datanode read lines of text from a document file, or a split / block of that file. It
parses the line of data into discrete words, as tokens separated by whitespace or other
punctuation. For each word encountered, it emit a key / value pair. In this case, the key would be
the word and the value would be the number of times that word occurred. Since the Map function
is only aware of the currently parsed word — since it is not context sensitive and does not have
any memory of prior processing — the number of occurrences of that word is 1.
7
After a Map function processes its input, the MapReduce framework partitions the data by key
value with records having the same key value going to the same Reduce function node.
The input to the Reduce function is data sorted on key value and then the data from each Map
function that provides data is merged based on the sorted key value.
We will see a more complete explanation of this in two slides from now, where partitioning and
combining are discussed. Partitioning and combining are done after the principal work of the
Mapper is complete on the Map task java virtual machine (JVM).
Partitioning is always performed if there is more than one node doing Reduce activity.
The Combiner function is optional and its use depends on the nature of the data and the
processing to be performed. 
8
The Reduce function is called once for each unique key in sorted order. It then iterates through
the values that are associated with that key and outputs zero or more values. The Reduce
function works on a set of key / value pairs independently of any other set of key / value pairs
and so multiple Reduce functions can be processed in parallel.
The output of a Reduce function is written to HDFS and is thus replicated (typically on three
different datanodes).
Continuing with WordCount example, the key / value pairs emitted by the Map functions were
sorted on the key value (in our case, the word), and all records for the same key value were sent
to the same Reduce function node. The Reduce function iterates through all of the records with
the same key value (for the same word) and calculates the number of occurrences. The Reduce
function then emits another record that contains the word and the total number of occurrences of
that word.
9
The Combiner and Partition functions fit between a Map function and a Reduce function.
The Map function potentially outputs a large number of key / value pairs. For the Reduce
function to work, all key / value pairs for a particular key value must be sent to the same
Reducer.
So how does the system know to which Reducer a particular key / value pair is to be sent? This is
handed by the Partition function.
The Partition function is given a key and the number of Reducers. It uses some process, typically
a hash function, or a modulo function, that converts the key value into a reducer index value.
Whatever function is used to generate the Reducer selection index, you want it to attempt to
evenly distribute the data across all reducer datanodes. There is a default partitioning function
but you have the option of coding your own.
Since all records emitted by all of the Map functions are transferred to Reducer datanodes, and
since Hadoop processing typically works with large amounts of data, we can agree that there is
going to be a lot of network traffic between the nodes in the cluster. This has a negative affect on
the overall performance of the job.
In fact, the two slowest parts of processing within an HDFS cluster are:
 disk access on a datanode (i.e., reading the data blocks / splits)
 inter datanode transmission of data
How can you lessen the network traffic? Well, the Combiner function is used to do just that.
To see how this works, let us look at the WordCount example again. Each Map datanode
processes a large amount of data. The odds are great that a particular Map function will parse the
same word multiple times. The question then becomes why transfer many records for the same
word, each with a count of 1, from a single Map function to a Reduce datanode? Why not send a
single record for each unique word that has the total occurrences of that word found in the data
that was process by that single Map task? Instead of sending 10,000 records for the word “the,”
each with a value of one, send one record for the word “the” and a value (= count) of 10,000. 
The Combiner is optional since it is not applicable in all use cases. In the case of the WordCount
example program, the Combiner java class code is exactly the same class code that the Reducer
performs, but it does it on each separate file sent to a Reducer and it is does it on the Mapper
JVM.
10
Normally Hadoop MR applications are written in Java. But there is an API that allows the Map
and Reduce functions to be written in any language — such as Perl or Ruby — that can read
from standard input and write to standard output. Hadoop Streaming uses UNIX standard
streams to interface between Hadoop and your non-Java program.
In addition, Hadoop Pipes is used to interface between C++ and Hadoop MR. Sockets are used
as the communication mechanism between the TaskTracker and the C++ Map or Reduce
functions.
We continue in the next video. 

5
MapReduce Overview (Continued)
6
Now let’s come back to Hadoop MR and look at the Mapper.
A Map function reads an input file — or, generally, a split of a file (in the form of a block or
blocks of a file or files) — creates a series of key / value pairs, processes each pair, and generates
zero or more output key / value pairs. Map functions do not require any order in the input data
and do not provide or require dependencies from one record of data to another. The output of a
Map function is written to the local file system as only one copy is needed — it is input to a
Reduce function and just a temporary set of data.
Let's look at an example. Assume that you want to count the occurrences of the various words in
a set of documents — this is the standard WordCount example program. The Map function
running on each datanode read lines of text from a document file, or a split / block of that file. It
parses the line of data into discrete words, as tokens separated by whitespace or other
punctuation. For each word encountered, it emit a key / value pair. In this case, the key would be
the word and the value would be the number of times that word occurred. Since the Map function
is only aware of the currently parsed word — since it is not context sensitive and does not have
any memory of prior processing — the number of occurrences of that word is 1.
7
After a Map function processes its input, the MapReduce framework partitions the data by key
value with records having the same key value going to the same Reduce function node.
The input to the Reduce function is data sorted on key value and then the data from each Map
function that provides data is merged based on the sorted key value.
We will see a more complete explanation of this in two slides from now, where partitioning and
combining are discussed. Partitioning and combining are done after the principal work of the
Mapper is complete on the Map task java virtual machine (JVM).
Partitioning is always performed if there is more than one node doing Reduce activity.
The Combiner function is optional and its use depends on the nature of the data and the
processing to be performed. 
8
The Reduce function is called once for each unique key in sorted order. It then iterates through
the values that are associated with that key and outputs zero or more values. The Reduce
function works on a set of key / value pairs independently of any other set of key / value pairs
and so multiple Reduce functions can be processed in parallel.
The output of a Reduce function is written to HDFS and is thus replicated (typically on three
different datanodes).
Continuing with WordCount example, the key / value pairs emitted by the Map functions were
sorted on the key value (in our case, the word), and all records for the same key value were sent
to the same Reduce function node. The Reduce function iterates through all of the records with
the same key value (for the same word) and calculates the number of occurrences. The Reduce
function then emits another record that contains the word and the total number of occurrences of
that word.
9
The Combiner and Partition functions fit between a Map function and a Reduce function.
The Map function potentially outputs a large number of key / value pairs. For the Reduce
function to work, all key / value pairs for a particular key value must be sent to the same
Reducer.
So how does the system know to which Reducer a particular key / value pair is to be sent? This is
handed by the Partition function.
The Partition function is given a key and the number of Reducers. It uses some process, typically
a hash function, or a modulo function, that converts the key value into a reducer index value.
Whatever function is used to generate the Reducer selection index, you want it to attempt to
evenly distribute the data across all reducer datanodes. There is a default partitioning function
but you have the option of coding your own.
Since all records emitted by all of the Map functions are transferred to Reducer datanodes, and
since Hadoop processing typically works with large amounts of data, we can agree that there is
going to be a lot of network traffic between the nodes in the cluster. This has a negative affect on
the overall performance of the job.
In fact, the two slowest parts of processing within an HDFS cluster are:
 disk access on a datanode (i.e., reading the data blocks / splits)
 inter datanode transmission of data
How can you lessen the network traffic? Well, the Combiner function is used to do just that.
To see how this works, let us look at the WordCount example again. Each Map datanode
processes a large amount of data. The odds are great that a particular Map function will parse the
same word multiple times. The question then becomes why transfer many records for the same
word, each with a count of 1, from a single Map function to a Reduce datanode? Why not send a
single record for each unique word that has the total occurrences of that word found in the data
that was process by that single Map task? Instead of sending 10,000 records for the word “the,”
each with a value of one, send one record for the word “the” and a value (= count) of 10,000. 
The Combiner is optional since it is not applicable in all use cases. In the case of the WordCount
example program, the Combiner java class code is exactly the same class code that the Reducer
performs, but it does it on each separate file sent to a Reducer and it is does it on the Mapper
JVM.
10
Normally Hadoop MR applications are written in Java. But there is an API that allows the Map
and Reduce functions to be written in any language — such as Perl or Ruby — that can read
from standard input and write to standard output. Hadoop Streaming uses UNIX standard
streams to interface between Hadoop and your non-Java program.
In addition, Hadoop Pipes is used to interface between C++ and Hadoop MR. Sockets are used
as the communication mechanism between the TaskTracker and the C++ Map or Reduce
functions.
We continue in the next video. 
