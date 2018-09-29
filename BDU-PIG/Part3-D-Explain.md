Apache Pig - The Explain Operator
=============================================
The ``explain`` operator is used to display the logical, physical, and MapReduce execution plans of a relation.

### Syntax
Given below is the syntax of the explain operator.
<pre><code>
grunt> explain Relation_name;
</code><pre>

### Example
Assume we have a file ``student_data.txt`` in HDFS with the following content.
<pre><code>
001,Rajiv,Reddy,9848022337,Hyderabad
002,siddarth,Battacharya,9848022338,Kolkata
003,Rajesh,Khanna,9848022339,Delhi
004,Preethi,Agarwal,9848022330,Pune
005,Trupthi,Mohanthy,9848022336,Bhuwaneshwar
006,Archana,Mishra,9848022335,Chennai.
</code></pre>
And we have read it into a relation student using the LOAD operator as shown below.
<pre><code>
grunt> student = LOAD 'hdfs://localhost:9000/pig_data/student_data.txt' USING PigStorage(',')
   as ( id:int, firstname:chararray, lastname:chararray, phone:chararray, city:chararray );
</code></pre>   
Now, let us explain the relation named student using the explain operator as shown below.
<pre><code>
grunt> explain student;
</code></pre>
Output

It will produce the following output.

<pre><code>
$ explain student;

2015-10-05 11:32:43,660 [main]
2015-10-05 11:32:43,660 [main] INFO  org.apache.pig.newplan.logical.optimizer
.LogicalPlanOptimizer -
....
</code></pre>
