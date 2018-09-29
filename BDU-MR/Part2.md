1
MapReduce Programming #2
Example: WordCount
1
We are going to look at a Java program example of MapReduce (MR)
and, in particular, the standard example program, WordCount.
For MapReduce we can consider this to be the equivalent of
“Hello, World!”
It illustrates the main features and gives us a working example of MR.
The complete program in Java is just 58 lines of code.
2
After completing this topic, you will be able to:
 Compare the new MapReduce API with the older API
 Describe the basic Java code that requires one to code
– the mapper class
– the reducer class
3
Effective with Hadoop version 0.20.0, a new Java MapReduce API was introduced. With
BigInsights v2.1 we use Hadoop 1.1.1 as the underlying open source.
This new API makes use of abstract classes versus interfaces. This makes it easier for the
new API to evolve in the future without breaking old implementations of various classes.
The data types are incompatible between the two APIs, so an older application must be
rewritten in order to take advantage of the new API.
The new API uses context objects to allow the user to communicate with the MapReduce
system. The new Context takes on the role of the JobConf, OutputCollector, and Reporter
found in the old API.
The new API allows both Mappers and Reducers to override the run() method in order to
process records in batches or to terminate execution before all records have been
processed. With the old API, this could only be accomplished by Mappers.
Output files are named differently. With the old API, both the Map and Reduce outputs
are named part-nnnnn (“part”, dash, followed by a five digit number). With the new
API, map output has the name of part-m-nnnnn and reduce output has the name of
part-r-nnnnn.
This course focuses on and uses the new API. 
2
4
There are four basic components of a MapReduce Java class.
This is the first — the Map component.
You defined a Map class that extends the imported Mapper class. The Mapper class has
four formal parameters. There is the input key and the input value as well as the output
key and the output value.
(Remember, MapReduce works with key/value pairs.)
Within your Mapper class, you reference the map() method.
The input key and value are passed to this method.
This method also provides an instance of Context which is used to write the output
key/value pair. Rather than using built-in Java types, the Mapper class (along with the
Reducer class) use Hadoop provided data types, which are optimized for network
serialization.
For example, instead of a Java Long we use LongWritable and instead of a Java String,
we use Text.
5
Here is the basic Map code.
The complete code for WordCount as a Java MR program is available separately for
study. Here we will look only at snippets.
The complete code for WordCount is worth separate study just as a beginner at Java
programming would read the standard example “Hello, World!” program.
6
The second component is the Reduce component.
You defined a Reduce class that extends the imported Reducer class.
The Reducer class has four formal parameters. There is the input key and the input value
as well as the output key and the output value.
Within your Reducer class, you reference the reduce() method. The input key and value
are passed to this method. Normally you would want to define the input value as iterable
so that you can easily process all of the values for a particular key.
This method also provides an instance of Context which is used to write the output
key/value pair.
7
Here is the basic Reduce code.
Again, this is a template with which to implement the required functionality. 
3
8
The third component is a Combiner component and is optional.
The idea behind the Combiner function is to do some data reduction at the Mapper node
and thus lessen the amount of data that needs to be transferred to the Reducer node.
A Combiner function cannot be used in all cases. For example, if you are trying to
calculate the maximum value, you could use a Combiner. That is because the maximum
value of a set of numbers is the same as dividing that set into multiple subsets, finding the
maximum value for each subset and then finding the maximum value from the set of
maximum values. So in this case, a Combiner would help.
But if you were calculating the average of a set of numbers, you could not divide the
numbers into subsets, calculate an average for each subset, and then use those average
values to calculate the average for the entire set. That Use Case is not able to take
advantage of a Combiner function.
Your Combiner function most likely is your Reducer function.
If for some reason you coded a separate combiner class, then you would still extend the
Reducer class and code the reduce() method to process your data.
9
The fourth component is the Main method.
You need to code a main() method that runs your code.
Here you specify which class is to be used as the Mapper, which class is to be used as the
Reducer, and whether there is going to be a Combiner.
Your application also needs to know where to find the input data. That information can
be hardcoded or can be accessed through a parameter passed to your application.
The input data can reside in a single file, in the files contained in a directory, or in files
that match some specified pattern.
You only specify a single output and that is a directory that does not yet exist.
10
Here is sample application code for the Main method.
11
Here we highlight the same sample application code — the Main method — and highlight
the critical section that lets Hadoop know what code to use for the
 Map
 Reduce, and
 Combiner classes
You will note here that, for WordCount, the Combiner class is the same as the Reducer
class. This sameness is common as we noted previously.
Let’s also talk about some other parts of the code, not shown here. 
4
If any arguments are passed, then you need to deal with them appropriately.
Your code is packaged into a JAR file and this JAR file gets distributed to the nodes in
the Hadoop cluster.
You do not have to explicitly specify the name of the JAR file. Hadoop uses the
``job.setJarByClass()`` method, to locate the JAR file that contains the class specified in that
method.
FileInputFormat.addInputPath() allows you to specify an input path that can be a single
file, a directory, or a file pattern. As the name implies, you can call the method repeatedly
in order to add multiple input paths.
There can only be a single output path that points to a directory and that directory must
not exist.

The job.setMapperClass(), job.setCombinerClass(), and job.setReducerClass() are used
to specify the classes to be used for those functions.

-----------------------------------------------------------------
To summarize:
* We have a clean abstraction for programmers
* Hadoop provides “automatic” way to parallelize programs and distribute work
* This is similar to an assembler-like language for Hadoop
* It is fault-tolerant
* If your process has a high number of intermediate results, faster network cards will help improve performance efficiency

Map functions run in parallel.
Reduce functions run in parallel.
Processing is done where the data resides. We want to minimize the transfer of data.
If a datanode has a problem, then the processing is moved to another datanode.
Remember, by default, a block of data get replicated to two additional different
datanodes, for a total of three copies of each block.
The three copies of each block are kept on two different racks, just in case one of the
racks fail (remember that a rack is defined as those nodes handled by a single network
switch).
13
You have now completed this topic and can proceed to work with the lab exercise. 
