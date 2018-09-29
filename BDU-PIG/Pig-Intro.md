Apache Pig
======================
Apache Pig is a platform for analyzing large data sets that consists of a high-level language for expressing data analysis programs, coupled with infrastructure for evaluating these programs. The salient property of Pig programs is that their structure is amenable to substantial parallelization, which in turns enables them to handle very large data sets.

At the present time, Pig's infrastructure layer consists of a compiler that produces sequences of Map-Reduce programs, for which large-scale parallel implementations already exist (e.g., the Hadoop subproject). 

###Pig Latin
Pig's language layer currently consists of a textual language called Pig Latin, which has the following key properties:

- ***Ease of programming***. It is trivial to achieve parallel execution of simple, "embarrassingly parallel" data analysis tasks. Complex tasks comprised of multiple interrelated data transformations are explicitly encoded as data flow sequences, making them easy to write, understand, and maintain.

- ***Optimization opportunities***. The way in which tasks are encoded permits the system to optimize their execution automatically, allowing the user to focus on semantics rather than efficiency.

- ***Extensibility***. Users can create their own functions to do special-purpose processing.

### Test objectives

* Understand the basic concepts of Pig
* Understand Pig Relational Operators
* Understand Pig Evaluation Operators
* Know how to Load, Dump, and Store Data using Pig

### What is PIG?
Pig was initially developed at Yahoo! to allow people using Hadoop® to focus more on analyzing large data sets and spend less time having to write mapper and reducer programs. Like actual pigs, who eat almost anything, the Pig programming language is designed to handle any kind of data—hence the name!

### Components of PIG
Pig is made up of two components: the first is the language itself, which is called ***PigLatin***, and the second is a runtime environment where PigLatin programs are executed.
